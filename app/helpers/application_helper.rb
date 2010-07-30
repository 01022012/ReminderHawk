# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flash_notice
    if flash[:notice]
      str = flash[:notice]
      flash[:notice] = nil # Hack: clear the flash!
      '<p class="error">'+ str + '</p>'
    elsif flash[:success]
      str = flash[:success]
      flash[:success] = nil
      '<p id="flash_success" class="success">'+ str + '</p>'
    end
  end

end
