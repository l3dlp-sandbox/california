/* libecal-1.2.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "E", gir_namespace = "ECalendar", gir_version = "1.2", lower_case_cprefix = "e_")]
namespace E {
	[CCode (cheader_filename = "libecal/libecal.h", type_id = "e_cal_client_get_type ()")]
	public class CalClient : E.Client, GLib.Initable, GLib.AsyncInitable, E.TimezoneCache {
		[CCode (has_construct_function = false)]
		public CalClient (E.Source source, E.CalClientSourceType source_type) throws GLib.Error;
		public async bool add_timezone (iCal.icaltimezone zone, GLib.Cancellable cancellable) throws GLib.Error;
		public bool add_timezone_sync (iCal.icaltimezone zone, GLib.Cancellable cancellable) throws GLib.Error;
		public bool check_one_alarm_only ();
		public bool check_organizer_must_accept ();
		public bool check_organizer_must_attend ();
		public bool check_recurrences_no_master ();
		public bool check_save_schedules ();
		public static bool check_timezones (iCal.icalcomponent comp, GLib.List comps, GLib.Callback tzlookup, void* ecalclient, GLib.Cancellable cancellable) throws GLib.Error;
		[CCode (finish_name = "e_cal_client_connect_finish")]
		public static async unowned E.Client connect (E.Source source, E.CalClientSourceType source_type, GLib.Cancellable cancellable) throws GLib.Error;
		public static unowned E.Client connect_sync (E.Source source, E.CalClientSourceType source_type, GLib.Cancellable cancellable) throws GLib.Error;
		public async bool create_object (iCal.icalcomponent icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool create_object_sync (iCal.icalcomponent icalcomp, string out_uid, GLib.Cancellable? cancellable) throws GLib.Error;
		public void create_objects (GLib.SList icalcomps, GLib.Cancellable cancellable, GLib.AsyncReadyCallback callback);
		public bool create_objects_finish (GLib.AsyncResult _result, GLib.SList out_uids) throws GLib.Error;
		public bool create_objects_sync (GLib.SList icalcomps, GLib.SList out_uids, GLib.Cancellable cancellable) throws GLib.Error;
		public async bool discard_alarm (string uid, string rid, string auid, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool discard_alarm_sync (string uid, string rid, string auid, GLib.Cancellable? cancellable) throws GLib.Error;
		public static GLib.Error error_create (E.CalClientError code, string custom_msg);
		public static GLib.Quark error_quark ();
		public static unowned string error_to_string (E.CalClientError code);
		public static void free_ecalcomp_slist (GLib.SList<E.CalComponent> ecalcomps);
		public static void free_icalcomp_slist (GLib.SList icalcomps);
		public void generate_instances (time_t start, time_t end, GLib.Cancellable? cancellable, [CCode (delegate_target_pos = 4.9)] E.CalRecurInstanceFn cb, [CCode (delegate_target_pos = 4.9)] owned GLib.DestroyNotify? destroy_cb_data);
		public void generate_instances_for_object (iCal.icalcomponent icalcomp, ulong start, ulong end, GLib.Cancellable? cancellable, E.CalRecurInstanceFn cb, void* cb_data, owned GLib.DestroyNotify? destroy_cb_data);
		public void generate_instances_for_object_sync (iCal.icalcomponent icalcomp, ulong start, ulong end, E.CalRecurInstanceFn cb, void* cb_data);
		public void generate_instances_sync (time_t start, time_t end, [CCode (delegate_target_pos = 3.9)] E.CalRecurInstanceFn cb);
		public async bool get_attachment_uris (string uid, string rid, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_attachment_uris_sync (string uid, string rid, GLib.SList out_attachment_uris, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned string get_component_as_string (iCal.icalcomponent icalcomp);
		public async bool get_default_object (GLib.Cancellable? cancellable, out unowned iCal.icalcomponent out_icalcomp) throws GLib.Error;
		public bool get_default_object_sync (out unowned iCal.icalcomponent out_icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned iCal.icaltimezone get_default_timezone ();
		public async bool get_free_busy (ulong start, ulong end, GLib.SList users, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_free_busy_sync (ulong start, ulong end, GLib.SList users, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned string get_local_attachment_store ();
		public async bool get_object (string uid, string rid, GLib.Cancellable? cancellable, out unowned iCal.icalcomponent out_icalcomp) throws GLib.Error;
		public async bool get_object_list (string sexp, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool get_object_list_as_comps (string sexp, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_object_list_as_comps_sync (string sexp, GLib.SList out_ecalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_object_list_sync (string sexp, GLib.SList out_icalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_object_sync (string uid, string rid, out unowned iCal.icalcomponent out_icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool get_objects_for_uid (string uid, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool get_objects_for_uid_sync (string uid, GLib.SList out_ecalcomps, GLib.Cancellable? cancellable) throws GLib.Error;
		public E.CalClientSourceType get_source_type ();
		public async bool get_timezone (string tzid, GLib.Cancellable? cancellable, out unowned iCal.icaltimezone out_zone) throws GLib.Error;
		public bool get_timezone_sync (string tzid, out unowned iCal.icaltimezone out_zone, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (finish_name = "e_cal_client_get_view_finish")]
		public async bool get_view (string sexp, GLib.Cancellable? cancellable, out unowned E.CalClientView out_view) throws GLib.Error;
		public bool get_view_sync (string sexp, out unowned E.CalClientView out_view, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool modify_object (iCal.icalcomponent icalcomp, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool modify_object_sync (iCal.icalcomponent icalcomp, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public void modify_objects (GLib.SList comps, E.CalObjModType mod, GLib.Cancellable cancellable, GLib.AsyncReadyCallback callback);
		public bool modify_objects_finish (GLib.AsyncResult _result) throws GLib.Error;
		public bool modify_objects_sync (GLib.SList comps, E.CalObjModType mod, GLib.Cancellable cancellable) throws GLib.Error;
		public async bool receive_objects (iCal.icalcomponent icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool receive_objects_sync (iCal.icalcomponent icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public async bool remove_object (string uid, string rid, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool remove_object_sync (string uid, string rid, E.CalObjModType mod, GLib.Cancellable? cancellable) throws GLib.Error;
		public void remove_objects (GLib.SList ids, E.CalObjModType mod, GLib.Cancellable cancellable, GLib.AsyncReadyCallback callback);
		public bool remove_objects_finish (GLib.AsyncResult _result) throws GLib.Error;
		public bool remove_objects_sync (GLib.SList ids, E.CalObjModType mod, GLib.Cancellable cancellable) throws GLib.Error;
		public static unowned iCal.icaltimezone resolve_tzid_cb (string tzid, void* data);
		public async bool send_objects (iCal.icalcomponent icalcomp, GLib.Cancellable? cancellable, out unowned iCal.icalcomponent out_modified_icalcomp) throws GLib.Error;
		public bool send_objects_sync (iCal.icalcomponent icalcomp, GLib.SList out_users, out unowned iCal.icalcomponent out_modified_icalcomp, GLib.Cancellable? cancellable) throws GLib.Error;
		public void set_default_timezone (iCal.icaltimezone zone);
		public static unowned iCal.icaltimezone tzlookup (string tzid, void* ecalclient, GLib.Cancellable cancellable) throws GLib.Error;
		public static unowned iCal.icaltimezone tzlookup_icomp (string tzid, void* custom, GLib.Cancellable cancellable) throws GLib.Error;
		public void* default_timezone { get; set; }
		public E.CalClientSourceType source_type { get; construct; }
		public virtual signal void free_busy_data (void* free_busy_ecalcomps);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public class CalClientView : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected CalClientView ();
		public void* get_client ();
		public unowned GLib.DBusConnection get_connection ();
		public unowned string get_object_path ();
		public bool is_running ();
		public void set_fields_of_interest (GLib.SList? fields_of_interest) throws GLib.Error;
		public void set_flags (E.CalClientViewFlags flags) throws GLib.Error;
		public void start () throws GLib.Error;
		public void stop () throws GLib.Error;
		[NoAccessorMethod]
		public E.CalClient client { owned get; construct; }
		public GLib.DBusConnection connection { get; construct; }
		public string object_path { get; construct; }
		public virtual signal void complete (GLib.Error error);
		public virtual signal void objects_added (GLib.SList<weak iCal.icalcomponent> objects);
		public virtual signal void objects_modified (GLib.SList<weak iCal.icalcomponent> objects);
		public virtual signal void objects_removed (GLib.SList<weak E.CalComponentId?> uids);
		public virtual signal void progress (uint percent, string message);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public class CalComponent : GLib.Object {
		[CCode (has_construct_function = false)]
		public CalComponent ();
		public void abort_sequence ();
		public void add_alarm (E.CalComponentAlarm alarm);
		public unowned E.CalComponent clone ();
		public void commit_sequence ();
		public bool event_dates_match (E.CalComponent comp2);
		public static void free_attendee_list (GLib.SList attendee_list);
		public static void free_categories_list (GLib.SList categ_list);
		public static void free_datetime (E.CalComponentDateTime dt);
		public static void free_exdate_list (GLib.SList exdate_list);
		public static void free_geo (void* geo);
		public static void free_icaltimetype (void* t);
		public static void free_id (E.CalComponentId id);
		public static void free_percent (int percent);
		public static void free_period_list (GLib.SList period_list);
		public static void free_priority (int priority);
		public static void free_range (E.CalComponentRange range);
		public static void free_recur_list (GLib.SList recur_list);
		public static void free_sequence (int sequence);
		public static void free_text_list (GLib.SList text_list);
		[CCode (has_construct_function = false)]
		public CalComponent.from_icalcomponent (iCal.icalcomponent icalcomp);
		[CCode (has_construct_function = false)]
		public CalComponent.from_string (string calobj);
		public static string gen_uid ();
		public unowned E.CalComponentAlarm get_alarm (string auid);
		public GLib.List get_alarm_uids ();
		public string get_as_string ();
		public void get_attachment_list (out GLib.SList attachment_list);
		public void get_attendee_list (out GLib.SList attendee_list);
		public void get_categories (out string categories);
		public void get_categories_list (out GLib.SList categ_list);
		public void get_classification (out E.CalComponentClassification classif);
		public void get_comment_list (out GLib.SList text_list);
		public void get_completed (out iCal.icaltimetype t);
		public void get_contact_list (out GLib.SList text_list);
		public void get_created (out iCal.icaltimetype t);
		public void get_description_list (out unowned GLib.SList<E.CalComponentText?> text_list);
		public void get_dtend (ref E.CalComponentDateTime dt);
		public void get_dtstamp (out iCal.icaltimetype t);
		public void get_dtstart (ref E.CalComponentDateTime dt);
		public void get_due (out E.CalComponentDateTime dt);
		public void get_exdate_list (out GLib.SList exdate_list);
		public void get_exrule_list (out GLib.SList recur_list);
		public void get_exrule_property_list (out GLib.SList recur_list);
		public void get_geo (out iCal.icalgeotype geo);
		public unowned iCal.icalcomponent get_icalcomponent ();
		public E.CalComponentId get_id ();
		public void get_last_modified (out iCal.icaltimetype t);
		public void get_location (out string location);
		public int get_num_attachments ();
		public void get_organizer (out E.CalComponentOrganizer organizer);
		public void get_percent (out int percent);
		public int get_percent_as_int ();
		public void get_priority (out int priority);
		public void get_rdate_list (out GLib.SList period_list);
		public void get_recurid (out E.CalComponentRange recur_id);
		public string get_recurid_as_string ();
		public void get_rrule_list (out GLib.SList recur_list);
		public void get_rrule_property_list (out GLib.SList recur_list);
		public void get_sequence (out int sequence);
		public void get_status (out iCal.icalproperty_status status);
		public void get_summary (out E.CalComponentText summary);
		public void get_transparency (out E.CalComponentTransparency transp);
		public void get_uid (out unowned string uid);
		public void get_url (out unowned string url);
		public E.CalComponentVType get_vtype ();
		public bool has_alarms ();
		public bool has_attachments ();
		public bool has_attendees ();
		public bool has_exceptions ();
		public bool has_exdates ();
		public bool has_exrules ();
		public bool has_organizer ();
		public bool has_rdates ();
		public bool has_recurrences ();
		public bool has_rrules ();
		public bool has_simple_recurrence ();
		public bool is_instance ();
		public void remove_alarm (string auid);
		public void remove_all_alarms ();
		public void rescan ();
		public void set_attachment_list (GLib.SList attachment_list);
		public void set_attendee_list (GLib.SList attendee_list);
		public void set_categories (string categories);
		public void set_categories_list (GLib.SList categ_list);
		public void set_classification (E.CalComponentClassification classif);
		public void set_comment_list (GLib.SList text_list);
		public void set_completed (iCal.icaltimetype t);
		public void set_contact_list (GLib.SList text_list);
		public void set_created (iCal.icaltimetype t);
		public void set_description_list (GLib.SList text_list);
		public void set_dtend (E.CalComponentDateTime dt);
		public void set_dtstamp (iCal.icaltimetype t);
		public void set_dtstart (E.CalComponentDateTime dt);
		public void set_due (E.CalComponentDateTime dt);
		public void set_exdate_list (GLib.SList exdate_list);
		public void set_exrule_list (GLib.SList recur_list);
		public void set_geo (iCal.icalgeotype geo);
		public bool set_icalcomponent (owned iCal.icalcomponent icalcomp);
		public void set_last_modified (iCal.icaltimetype t);
		public void set_location (string location);
		public void set_new_vtype (E.CalComponentVType type);
		public void set_organizer (E.CalComponentOrganizer organizer);
		public void set_percent (int percent);
		public void set_percent_as_int (int percent);
		public void set_priority (int priority);
		public void set_rdate_list (GLib.SList period_list);
		public void set_recurid (E.CalComponentRange recur_id);
		public void set_rrule_list (GLib.SList recur_list);
		public void set_sequence (int sequence);
		public void set_status (iCal.icalproperty_status status);
		public void set_summary (E.CalComponentText summary);
		public void set_transparency (E.CalComponentTransparency transp);
		public void set_uid (string uid);
		public void set_url (string url);
		public void strip_errors ();
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	[Compact]
	public class CalComponentAlarm {
		[CCode (has_construct_function = false)]
		public CalComponentAlarm ();
		public E.CalComponentAlarm clone ();
		public void get_action (out E.CalComponentAlarmAction action);
		public void get_attach (out iCal.icalattach attach);
		public void get_attendee_list (out GLib.SList attendee_list);
		public void get_description (out E.CalComponentText description);
		public iCal.icalcomponent get_icalcomponent ();
		public void get_repeat (E.CalComponentAlarmRepeat repeat);
		public void get_trigger (E.CalComponentAlarmTrigger trigger);
		public unowned string get_uid ();
		public bool has_attendees ();
		public void set_action (E.CalComponentAlarmAction action);
		public void set_attach (iCal.icalattach attach);
		public void set_attendee_list (GLib.SList attendee_list);
		public void set_description (E.CalComponentText description);
		public void set_repeat (E.CalComponentAlarmRepeat repeat);
		public void set_trigger (E.CalComponentAlarmTrigger trigger);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	[Compact]
	public class CalObjModType {
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public interface TimezoneCache : GLib.Object {
		public abstract void add_timezone (iCal.icaltimezone zone);
		public abstract unowned iCal.icaltimezone get_timezone (string tzid);
		public abstract unowned GLib.List list_timezones ();
		public signal void timezone_added (void* zone);
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalChange {
		public weak E.CalComponent comp;
		public E.CalChangeType type;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmInstance {
		public weak string auid;
		public ulong trigger;
		public ulong occur_start;
		public ulong occur_end;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmRepeat {
		public int repetitions;
		public void* duration;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarmTrigger {
		public E.CalComponentAlarmTriggerType type;
		public void* u;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAlarms {
		public weak E.CalComponent comp;
		public weak GLib.SList<E.CalComponentAlarmInstance> alarms;
		public void free ();
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentAttendee {
		public weak string value;
		public weak string member;
		public iCal.icalparameter_cutype cutype;
		public iCal.icalparameter_role role;
		public iCal.icalparameter_partstat status;
		public bool rsvp;
		public weak string delto;
		public weak string delfrom;
		public weak string sentby;
		public weak string cn;
		public weak string language;
	}
	[CCode (cheader_filename = "libecal/libecal.h", has_destroy_function = false)]
	public struct CalComponentDateTime {
		public iCal.icaltimetype* value;
		public weak string tzid;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentId {
		public weak string uid;
		public weak string rid;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentOrganizer {
		public weak string value;
		public weak string sentby;
		public weak string cn;
		public weak string language;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentPeriod {
		public E.CalComponentPeriodType type;
		public iCal.icaltimetype start;
		public void* u;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentRange {
		public E.CalComponentRangeType type;
		public E.CalComponentDateTime datetime;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalComponentText {
		public weak string value;
		public weak string altrep;
	}
	[CCode (cheader_filename = "libecal/libecal.h")]
	public struct CalObjInstance {
		public weak string uid;
		public ulong start;
		public ulong end;
		[CCode (cname = "cal_obj_instance_list_free")]
		public static void list_free (GLib.List list);
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CHANGE_")]
	[Flags]
	public enum CalChangeType {
		ADDED,
		MODIFIED,
		DELETED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_ERROR_", has_type_id = false)]
	public enum CalClientError {
		NO_SUCH_CALENDAR,
		OBJECT_NOT_FOUND,
		INVALID_OBJECT,
		UNKNOWN_USER,
		OBJECT_ID_ALREADY_EXISTS,
		INVALID_RANGE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_SOURCE_TYPE_")]
	public enum CalClientSourceType {
		EVENTS,
		TASKS,
		MEMOS
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_CLIENT_VIEW_FLAGS_", has_type_id = false)]
	public enum CalClientViewFlags {
		NONE,
		NOTIFY_INITIAL
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_ALARM_", has_type_id = false)]
	public enum CalComponentAlarmAction {
		NONE,
		AUDIO,
		DISPLAY,
		EMAIL,
		PROCEDURE,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_ALARM_TRIGGER_", has_type_id = false)]
	public enum CalComponentAlarmTriggerType {
		NONE,
		RELATIVE_START,
		RELATIVE_END,
		ABSOLUTE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_CLASS_", has_type_id = false)]
	public enum CalComponentClassification {
		NONE,
		PUBLIC,
		PRIVATE,
		CONFIDENTIAL,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_FIELD_", has_type_id = false)]
	public enum CalComponentField {
		CATEGORIES,
		CLASSIFICATION,
		COMPLETED,
		DTEND,
		DTSTART,
		DUE,
		GEO,
		PERCENT,
		PRIORITY,
		SUMMARY,
		TRANSPARENCY,
		URL,
		HAS_ALARMS,
		ICON,
		COMPLETE,
		RECURRING,
		OVERDUE,
		COLOR,
		STATUS,
		COMPONENT,
		LOCATION,
		NUM_FIELDS
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_PERIOD_", has_type_id = false)]
	public enum CalComponentPeriodType {
		DATETIME,
		DURATION
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_RANGE_", has_type_id = false)]
	public enum CalComponentRangeType {
		SINGLE,
		THISPRIOR,
		THISFUTURE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_TRANSP_", has_type_id = false)]
	public enum CalComponentTransparency {
		NONE,
		TRANSPARENT,
		OPAQUE,
		UNKNOWN
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_COMPONENT_", has_type_id = false)]
	public enum CalComponentVType {
		NO_TYPE,
		EVENT,
		TODO,
		JOURNAL,
		FREEBUSY,
		TIMEZONE
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_LOAD_", has_type_id = false)]
	public enum CalLoadState {
		NOT_LOADED,
		LOADING,
		LOADED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "CAL_MODE_", has_type_id = false)]
	public enum CalMode {
		INVALID,
		LOCAL,
		REMOTE,
		ANY
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalModeEnum {
		CalModeInvalid,
		CalModeLocal,
		CalModeRemote,
		CalModeAny
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_SET_MODE_", has_type_id = false)]
	public enum CalSetModeStatus {
		SUCCESS,
		ERROR,
		NOT_SUPPORTED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalSetModeStatusEnum {
		ECalSetModeSuccess,
		ECalSetModeError,
		ECalSetModeNotSupported
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CAL_SOURCE_TYPE_", has_type_id = false)]
	public enum CalSourceType {
		EVENT,
		TODO,
		JOURNAL,
		LAST
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	public enum CalSourceTypeEnum {
		Event,
		ToDo,
		Journal,
		Invalid
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "E_CALENDAR_STATUS_")]
	public enum CalendarStatus {
		OK,
		INVALID_ARG,
		BUSY,
		REPOSITORY_OFFLINE,
		NO_SUCH_CALENDAR,
		OBJECT_NOT_FOUND,
		INVALID_OBJECT,
		URI_NOT_LOADED,
		URI_ALREADY_LOADED,
		PERMISSION_DENIED,
		UNKNOWN_USER,
		OBJECT_ID_ALREADY_EXISTS,
		PROTOCOL_NOT_SUPPORTED,
		CANCELLED,
		COULD_NOT_CANCEL,
		AUTHENTICATION_FAILED,
		AUTHENTICATION_REQUIRED,
		DBUS_EXCEPTION,
		OTHER_ERROR,
		INVALID_SERVER_VERSION,
		NOT_SUPPORTED
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "", has_type_id = false)]
	public enum DataCalMode {
		Local,
		Remote,
		AnyMode
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	[Flags]
	public enum DataCalObjModType {
		This,
		ThisAndPrior,
		ThisAndFuture,
		All
	}
	[CCode (cheader_filename = "libecal/libecal.h", cprefix = "")]
	[Flags]
	public enum DataCalObjType {
		Event,
		Todo,
		Journal,
		AnyType
	}
	[CCode (cheader_filename = "libecal/libecal.h", instance_pos = 3.9)]
	public delegate bool CalRecurInstanceFn (E.CalComponent comp, time_t instance_start, time_t instance_end);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public delegate iCal.icaltimezone CalRecurResolveTimezoneFn (string tzid);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_ALARM_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_CAL_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_BACKEND_PROPERTY_DEFAULT_OBJECT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ALARM_DESCRIPTION;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_BULK_ADDS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_BULK_MODIFIES;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_BULK_REMOVES;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_CREATE_MESSAGES;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_DELEGATE_SUPPORTED;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_DELEGATE_TO_MANY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_HAS_UNACCEPTED_MEETING;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_ALARM_AFTER_START;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_ALARM_REPEAT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_AUDIO_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_CONV_TO_ASSIGN_TASK;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_CONV_TO_RECUR;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_DISPLAY_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_EMAIL_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_GEN_OPTIONS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_ORGANIZER;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_PROCEDURE_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_TASK_ASSIGNMENT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_THISANDFUTURE;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_THISANDPRIOR;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_NO_TRANSPARENCY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ONE_ALARM_ONLY;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_MUST_ACCEPT;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_MUST_ATTEND;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_ORGANIZER_NOT_EMAIL_ADDRESS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_RECURRENCES_NO_MASTER;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REFRESH_SUPPORTED;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REMOVE_ALARMS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REMOVE_ONLY_THIS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_REQ_SEND_OPTIONS;
	[CCode (cheader_filename = "libecal/libecal.h")]
	public const string CAL_STATIC_CAPABILITY_SAVE_SCHEDULES;
	[CCode (cheader_filename = "libecal/libecal.h", cname = "cal_obj_uid_list_free")]
	public static void cal_obj_uid_list_free (GLib.List list);
	[CCode (cheader_filename = "libecal/libecal.h")]
	public static GLib.Quark calendar_error_quark ();
	[CCode (cheader_filename = "libecal/libecal.h", cname = "icaltimetype_to_tm")]
	public static void* icaltimetype_to_tm (void* itt);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "icaltimetype_to_tm_with_zone")]
	public static void* icaltimetype_to_tm_with_zone (void* itt, iCal.icaltimezone from_zone, iCal.icaltimezone to_zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "isodate_from_time_t")]
	public static string isodate_from_time_t (time_t t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_day")]
	public static ulong time_add_day (ulong time, int days);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_day_with_zone")]
	public static ulong time_add_day_with_zone (ulong time, int days, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_month_with_zone")]
	public static ulong time_add_month_with_zone (ulong time, int months, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_week")]
	public static ulong time_add_week (ulong time, int weeks);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_add_week_with_zone")]
	public static ulong time_add_week_with_zone (ulong time, int weeks, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_begin")]
	public static ulong time_day_begin (ulong t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_begin_with_zone")]
	public static ulong time_day_begin_with_zone (ulong time, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_end")]
	public static ulong time_day_end (ulong t);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_end_with_zone")]
	public static ulong time_day_end_with_zone (ulong time, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_of_week")]
	public static int time_day_of_week (int day, int month, int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_day_of_year")]
	public static int time_day_of_year (int day, int month, int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_days_in_month")]
	public static int time_days_in_month (int year, int month);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_from_isodate")]
	public static ulong time_from_isodate (string str);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_is_leap_year")]
	public static bool time_is_leap_year (int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_leap_years_up_to")]
	public static int time_leap_years_up_to (int year);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_month_begin_with_zone")]
	public static ulong time_month_begin_with_zone (ulong time, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_to_gdate_with_zone")]
	public static void time_to_gdate_with_zone (GLib.Date date, ulong time, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_week_begin_with_zone")]
	public static ulong time_week_begin_with_zone (ulong time, int week_start_day, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "time_year_begin_with_zone")]
	public static ulong time_year_begin_with_zone (ulong time, iCal.icaltimezone zone);
	[CCode (cheader_filename = "libecal/libecal.h", cname = "tm_to_icaltimetype")]
	public static void* tm_to_icaltimetype (void* tm, bool is_date);
}
