class Reminder < ActiveRecord::Base

  belongs_to  :event

  UNITS = ["Minutes", "Hours",  "Days"]
  INTERVAL = [:minute, :hour, :day]


  def after_save
    # Now set the actual reminder time in UTC
#    self.remind_at = event.start - duration.send(INTERVAL[unit])
#    save
  end

end
