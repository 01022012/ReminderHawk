class EventsController < ApplicationController

  before_filter :login_required

  def index
    @events = current_user.events
    @main_tab = 0
   end

  def new
    start = Time.zone.parse(params[:date].gsub(/GMT.*$/,''))
    @event = Event.new(:start => start,
                       :end => start + 30.minutes)
    @event.phone_numbers.build(:number => current_user.mobile)
    @event.reminders.build(:duration => 3, :unit => 1)
    respond_to do |format|
      format.js
    end
  end

  def create
    @event = current_user.events.new(params[:event])
    if @event.save
      respond_to do |format|
        format.js
      end
    else  
      respond_to do |format|
        format.js {render :action => 'new'}
      end
    end
  end

  def edit
    @event = current_user.events.find(params[:id])

    respond_to do |format|
      format.js
    end
  end


  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(params[:event])
      respond_to do |format|
        format.js {render :text => "window.location=\"#{events_url}\""}
      end
    else  
      respond_to do |format|
        format.js {render :action => 'edit'}
      end
    end
  end

end
