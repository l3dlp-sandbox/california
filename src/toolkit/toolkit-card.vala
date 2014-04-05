/* Copyright 2014 Yorba Foundation
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */

namespace California.Toolkit {

/**
 * A Card is a single pane of widget(s) in a {@link Deck}.
 *
 * The navigation of Cards is tracked within their Deck, and Cards can request navigation via their
 * various signals.  They're also notified when nevigation which affects them is made.
 */

public interface Card : Gtk.Widget {
    /**
     * Each {@link Card} has its own identifier that should be unique within the {@link Deck}.
     *
     * In the Gtk.Stack, this is its name.
     */
    public abstract string card_id { get; }
    
    /**
     * A user-visible string that may be used elsewhere in the application.
     *
     * Gtk.StackSwitcher uses this title.  {@link Deck} does not use the title in any way.
     */
    public abstract string? title { get; }
    
    /** 
     * The widget the {@link Card} wants to be default when navigated to.
     *
     * The widget must have can-default set to true.
     */
    public abstract Gtk.Widget? default_widget { get; }
    
    /**
     * The widget the {@link Card} wants to have initial focus when navigated to.
     *
     * Focus is set after {@link default_widget} is handled, so if this widget has receives-default
     * set to true, it will get the default as well.
     *
     * The widget must have can-focus set to true.
     */
    public abstract Gtk.Widget? initial_focus { get; }
    
    /**
     * Returns the {@link Deck} this {@link Card} is registered to, if any.
     */
    public Deck? deck { get { return parent as Deck; } }
    
    /**
     * Fired when the {@link Card} wishes to jump to another Card in the same {@link Deck.}
     *
     * Each Card can accept a message which parameterizes its activation.  It's up to Cards
     * navigating to the new one to construct and pass an appropriate message.
     *
     * @see jump_to_card_by_name
     */
    public signal void jump_to_card(Card next, Value? message);
    
    /**
     * Fired when the {@link Card} wishes to jump to another Card by its name.
     *
     * @see jump_to_card
     */
    public signal void jump_to_card_by_name(string name, Value? message);
    
    /**
     * Fired when the {@link Card} wishes to jump to the previous Card in the {@link Deck}.
     *
     * Note that this Card's position in the navigation stack is lost; there is no "jump forward".
     */
    public signal void jump_back();
    
    /**
     * Fired when the {@link Card} wishes to jump to the first Card in the {@link Deck}.
     *
     * This clears the Deck's navigation stack, meaning {@link jump_back} will not return to
     * this Card.
     */
    public signal void jump_home();
    
    /**
     * Fired when the {@link Deck}'s work is cancelled, closed, or dismissed, whether due to
     * programmatic reasons or by user request.
     *
     * Implementing classes should fire this after firing the {@link completed signal} so
     * subscribers can maintain their cleanup in a single handler.
     */
    public signal void dismissed(bool user_request);
    
    /**
     * Fired when the {@link Deck}'s work has completed successfully.
     *
     * This should only be fired if the Deck requires valid input from the user to perform
     * some intensive operation.  Merely displaying information and closing the Deck
     * should simply fire {@link dismissed}.
     *
     * "completed" implies that dismissed will be called shortly thereafter, meaning all
     * cleanup can be handled there.
     */
    public signal void completed();
    
    /**
     * Called by {@link Deck} when the {@link Card} has been activated, i.e. put to the "top" of
     * the Deck.
     *
     * message may be null even if the Card expects one; generally this means {@link jump_back}
     * or {@link jump_home} was invoked, resulting in this Card being activated.
     *
     * This is called before dealing with {@link default_widget} and {@link initial_focus}, so
     * changes to those properties in this call, if need be.
     */
    public abstract void jumped_to(Card? from, Value? message);
}

}