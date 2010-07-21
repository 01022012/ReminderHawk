class EventsController < ApplicationController

  before_filter :login_required

  def index

  end

  def new
    start = Time.parse(params[:date].gsub(/GMT.*$/,''))
    @event = Event.new(:start => start)
    respond_to do |format|
      format.html { render :nothing => true }
      format.js
    end
  end

end
