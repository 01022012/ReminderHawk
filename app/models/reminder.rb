class Reminder < ActiveRecord::Base

  belongs_to  :event

  UNITS = ["Minutes", "Hours",  "Days"]
  INTERVAL = [:minute, :hour, :day]


  def before_save
    # Now set the actual reminder time in UTC
    self.remind_at = event.start - duration.send(INTERVAL[unit])
  end

end
