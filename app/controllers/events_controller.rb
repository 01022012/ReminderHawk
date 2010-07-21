class EventsController < ApplicationController

  before_filter :login_required

  def index
    @events = current_user.events
   end

  def new
    start = Time.parse(params[:date].gsub(/GMT.*$/,''))
    @event = Event.new(:start => start,
                       :end => start + 30.minutes)
    respond_to do |format|
      format.html { render :nothing => true }
      format.js
    end
  end

  def create
    @event = current_user.events.new(params[:event])
    if @event.save
      render :update do |page|
        page.redirect_to  events_url
      end
    else  
      respond_to do |format|
        format.js {render :action => 'new'}
      end
    end
  end

end
