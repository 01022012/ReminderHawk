class MainController < ApplicationController

  def index
    redirect_to events_url if logged_in?
  end

end
