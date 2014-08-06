/* Copyright 2014 Yorba Foundation
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */

namespace California.Host {

[GtkTemplate (ui = "/org/yorba/california/rc/date-time-widget.ui")]
public class DateTimeWidget : Gtk.Box {
    public const string PROP_ENABLE_TIME = "enable-time";
    public const string PROP_ENABLE_DATE = "enable-date";
    public const string PROP_DATE = "date";
    public const string PROP_WALL_TIME = "wall-time";
    public const string PROP_FLOOR = "floor";
    public const string PROP_CEILING = "ceiling";
    public const string PROP_OUT_OF_RANGE = "out-of-range";
    
    public bool enable_time { get; set; default = true; }
    
    public bool enable_date { get; set; default = true; }
    
    public Calendar.Date date { get; set; default = Calendar.System.today; }
    
    public Calendar.WallTime wall_time { get; set; default = Calendar.System.now.to_wall_time(); }
    
    public Calendar.ExactTime? floor { get; set; default = null; }
    
    public Calendar.ExactTime? ceiling { get; set; default = null; }
    
    /**
     * Indicates if the widgets are filled-in with invalid values or is valid but out of the range
     * of {@link floor} and/or {@link ceiling}.
     */
    public bool out_of_range { get; protected set; default = false; }
    
    [GtkChild]
    private Gtk.Calendar calendar;
    
    [GtkChild]
    private Gtk.Entry hour_entry;
    
    [GtkChild]
    private Gtk.Label colon_label;
    
    [GtkChild]
    private Gtk.Entry minutes_entry;
    
    [GtkChild]
    private Gtk.Label meridiem_label;
    
    [GtkChild]
    private Gtk.EventBox hour_up;
    
    [GtkChild]
    private Gtk.EventBox hour_down;
    
    [GtkChild]
    private Gtk.EventBox minutes_up;
    
    [GtkChild]
    private Gtk.EventBox minutes_down;
    
    [GtkChild]
    private Gtk.EventBox meridiem_up;
    
    [GtkChild]
    private Gtk.EventBox meridiem_down;
    
    private Toolkit.ButtonConnector button_connector = new Toolkit.ButtonConnector();
    private Toolkit.EntryFilterConnector numeric_filter = new Toolkit.EntryFilterConnector.only_numeric();
    
    public DateTimeWidget() {
        button_connector.connect_to(hour_up);
        button_connector.connect_to(hour_down);
        button_connector.connect_to(minutes_up);
        button_connector.connect_to(minutes_down);
        button_connector.connect_to(meridiem_up);
        button_connector.connect_to(meridiem_down);
        
        numeric_filter.connect_to(hour_entry);
        numeric_filter.connect_to(minutes_entry);
        
        // specifically-enabled sensitivities
        bind_bool_to_time_controls(PROP_ENABLE_TIME, iterate<Gtk.Widget>(
            hour_up, hour_down, minutes_up, minutes_down, meridiem_up, meridiem_down,
            hour_entry, colon_label, minutes_entry, meridiem_label));
        
        // set sensitivities for up/down widgets
        foreach (Gtk.Widget widget in
            iterate<Gtk.Widget>(hour_up, hour_down, minutes_up, minutes_down, meridiem_up, meridiem_down)) {
            bind_property(PROP_DATE, widget, "sensitive", BindingFlags.SYNC_CREATE,
                transform_adjustment_widget_to_sensitive);
            bind_property(PROP_WALL_TIME, widget, "sensitive", BindingFlags.SYNC_CREATE,
                transform_adjustment_widget_to_sensitive);
            bind_property(PROP_FLOOR, widget, "sensitive", BindingFlags.SYNC_CREATE,
                transform_adjustment_widget_to_sensitive);
            bind_property(PROP_CEILING, widget, "sensitive", BindingFlags.SYNC_CREATE,
                transform_adjustment_widget_to_sensitive);
        }
        
        bind_bool_to_time_controls(PROP_ENABLE_DATE, iterate<Gtk.Widget>(calendar));
        
        // use signal handlers to initialize widgets
        on_date_changed();
        on_wall_time_changed();
        
        connect_property_signals();
        connect_widget_signals();
        
        // honor 24-hour time
        Calendar.System.instance.is_24hr_changed.connect(system_24hr_changed);
        system_24hr_changed();
        
        // GTK 3.12 requires this in order to constrain GtkEntry width, older versions were happy
        // with width_chars alone
#if GTK_312
        hour_entry.max_width_chars = minutes_entry.max_width_chars = 2;
#endif
    }
    
    ~DateTimeWidget() {
        Calendar.System.instance.is_24hr_changed.disconnect(system_24hr_changed);
    }
    
    private void bind_bool_to_time_controls(string property, California.Iterable<Gtk.Widget> time_widgets) {
        foreach (Gtk.Widget time_widget in time_widgets)
            bind_property(property, time_widget, "sensitive", BindingFlags.SYNC_CREATE);
    }
    
    // Determine if the up/down adjustments should be sensitive (if they're next value is valid)
    private bool transform_adjustment_widget_to_sensitive(Binding binding, Value source_value,
        ref Value target_value) {
        int amount;
        Calendar.TimeUnit time_unit;
        if (!adjust_time_controls((Gtk.Widget) binding.target, out amount, out time_unit))
            return false;
        
        target_value = is_valid_date_time(date, wall_time.adjust(amount, time_unit, null));
        
        return true;
    }
    
    private void connect_property_signals() {
        notify[PROP_DATE].connect(on_date_changed);
        notify[PROP_WALL_TIME].connect(on_wall_time_changed);
    }
    
    private void disconnect_property_signals() {
        notify[PROP_DATE].disconnect(on_date_changed);
        notify[PROP_WALL_TIME].disconnect(on_wall_time_changed);
    }
    
    private void connect_widget_signals() {
        button_connector.clicked.connect(on_time_adjustment_clicked);
        
        calendar.day_selected.connect(on_calendar_day_selected);
        calendar.month_changed.connect(on_calendar_month_or_year_changed);
        calendar.next_year.connect(on_calendar_month_or_year_changed);
        calendar.prev_year.connect(on_calendar_month_or_year_changed);
        hour_entry.changed.connect(on_time_entry_changed);
        minutes_entry.changed.connect(on_time_entry_changed);
    }
    
    private void disconnect_widget_signals() {
        button_connector.clicked.disconnect(on_time_adjustment_clicked);
        
        calendar.day_selected.disconnect(on_calendar_day_selected);
        calendar.month_changed.disconnect(on_calendar_month_or_year_changed);
        calendar.next_year.disconnect(on_calendar_month_or_year_changed);
        calendar.prev_year.disconnect(on_calendar_month_or_year_changed);
        hour_entry.changed.disconnect(on_time_entry_changed);
        minutes_entry.changed.disconnect(on_time_entry_changed);
    }
    
    private bool on_time_adjustment_clicked(Toolkit.ButtonEvent details) {
        if (details.button != Toolkit.Button.PRIMARY)
            return Toolkit.PROPAGATE;
        
        int amount;
        Calendar.TimeUnit time_unit;
        if (!adjust_time_controls(details.widget, out amount, out time_unit))
            return Toolkit.PROPAGATE;
        
        // use free_adjust() to adjust each unit individually without affecting others
        Calendar.WallTime new_wall_time = wall_time.free_adjust(amount, time_unit);
        
        // ensure it's clamped ... this assignment will update the entry fields, so don't
        // disconnect widget signals
        if (is_valid_date_time(date, new_wall_time))
            wall_time = new_wall_time;
        
        return Toolkit.STOP;
    }
    
    private bool adjust_time_controls(Gtk.Widget widget, out int amount, out Calendar.TimeUnit time_unit) {
        if (widget == hour_up) {
            amount = 1;
            time_unit = Calendar.TimeUnit.HOUR;
        } else if (widget == hour_down) {
            amount = -1;
            time_unit = Calendar.TimeUnit.HOUR;
        } else if (widget == minutes_up) {
            amount = 5;
            time_unit = Calendar.TimeUnit.MINUTE;
        } else if (widget == minutes_down) {
            amount = -5;
            time_unit = Calendar.TimeUnit.MINUTE;
        } else if (widget == meridiem_up) {
            amount = 12;
            time_unit = Calendar.TimeUnit.HOUR;
        } else if (widget == meridiem_down) {
            amount = -12;
            time_unit = Calendar.TimeUnit.HOUR;
        } else {
            amount = 0;
            time_unit = Calendar.TimeUnit.HOUR;
            
            return false;
        }
        
        return true;
    }
    
    private bool is_valid_date_time(Calendar.Date proposed_date, Calendar.WallTime proposed_time) {
        Calendar.ExactTime exact_time = new Calendar.ExactTime(Calendar.Timezone.local, proposed_date,
            proposed_time);
        
        return exact_time.clamp(floor, ceiling).equal_to(exact_time);
    }
    
    private Calendar.Date? get_selected_date() {
        if (calendar.day == 0)
            return null;
        
        try {
            return new Calendar.Date(
                Calendar.DayOfMonth.for(calendar.day),
                Calendar.Month.for(calendar.month + 1),
                new Calendar.Year(calendar.year)
            );
        } catch (CalendarError calerr) {
            debug("Unable to generate date from Gtk.Calendar: %s", calerr.message);
            
            return null;
        }
    }
    
    private void on_calendar_day_selected() {
        disconnect_property_signals();
        
        Calendar.Date? selected = get_selected_date();
        if (selected != null && is_valid_date_time(selected, wall_time) && !selected.equal_to(date))
            date = selected;
        
        // even if user picked invalid date, this resets selection to valid one
        on_date_changed();
        
        connect_property_signals();
    }
    
    private void on_calendar_month_or_year_changed() {
        // If selected month/year is not for the current date, don't select the day of that month/year
        // ... if selected month/year is for the current date, ensure that the day is selected ...
        // and as a fallback, don't select the day of the month/year
        Calendar.Date? selected = get_selected_date();
        if (selected != null) {
            if (selected.month_of_year().equal_to(date.month_of_year()))
                calendar.day = date.day_of_month.value;
            else
                calendar.day = 0;
        } else if (date.month.value == (calendar.month + 1) && date.year.value == calendar.year) {
            calendar.day = date.day_of_month.value;
        } else {
            calendar.day = 0;
        }
    }
    
    private void on_date_changed() {
        disconnect_widget_signals();
        
        calendar.day = date.day_of_month.value;
        calendar.month = date.month.value - 1;
        calendar.year = date.year.value;
        
        connect_widget_signals();
    }
    
    private void on_wall_time_changed() {
        disconnect_widget_signals();
        
        hour_entry.text = "%d".printf(Calendar.System.is_24hr ? wall_time.hour : wall_time.12hour);
        minutes_entry.text = "%02d".printf(wall_time.minute);
        meridiem_label.label = wall_time.is_pm ? Calendar.FMT_PM : Calendar.FMT_AM;
        
        connect_widget_signals();
    }
    
    private void on_time_entry_changed() {
        Calendar.WallTime new_wall_time;
        bool valid = validate_time_entries(out new_wall_time);
        
        disconnect_property_signals();
        
        out_of_range = !valid;
        if (valid)
            wall_time = new_wall_time;
        
        connect_property_signals();
    }
    
    private bool validate_time_entries(out Calendar.WallTime new_wall_time) {
        // maintain current until validated
        new_wall_time = wall_time;
        
        if (String.is_empty(hour_entry.text) || String.is_empty(minutes_entry.text))
            return false;
        
        int hour = int.parse(hour_entry.text);
        if (!Calendar.System.is_24hr && meridiem_label.label == Calendar.FMT_PM && hour < 12)
            hour += 12;
        
        int min = int.parse(minutes_entry.text);
        
        if (hour > Calendar.WallTime.MAX_HOUR || hour < 0 || min > Calendar.WallTime.MAX_MINUTE || min < 0)
            return false;
        
        Calendar.WallTime entry_wall_time = new Calendar.WallTime(hour, min, 0);
        
        Calendar.ExactTime entry_time = new Calendar.ExactTime(Calendar.Timezone.local, date, entry_wall_time);
        if (floor != null && entry_time.compare_to(floor) < 0)
            return false;
        
        if (ceiling != null && entry_time.compare_to(ceiling) > 0)
            return false;
        
        new_wall_time = entry_wall_time;
        
        return true;
    }
    
    private void system_24hr_changed() {
        meridiem_label.visible = meridiem_up.visible = meridiem_down.visible = !Calendar.System.is_24hr;
        meridiem_label.no_show_all = meridiem_up.no_show_all = meridiem_down.no_show_all = Calendar.System.is_24hr;
        
        // redo time widgets
        on_wall_time_changed();
    }
}

}

