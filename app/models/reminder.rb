class Reminder < ActiveRecord::Base

  belongs_to  :event

  UNITS = ["Minutes", "Hours",  "Days"]
  INTERVAL = [:minute, :hour, :day]


  def before_save
    # Now set the actual reminder time in UTC
    self.remind_at = event.start - duration.send(INTERVAL[unit])
  end

  def validate
    RAILS_DEFAULT_LOGGER.info("Event is #{event_id}")
    errors.add_to_base "Reminder has to be atleast 10 minutes from now" if  (Time.now - duration.send(INTERVAL[unit])) > (Time.now - 10.minutes)
    errors.add_to_base "Reminder has to be atleast 10 minutes from now" if  (Time.now - duration.send(INTERVAL[unit])) > (Time.now - 10.minutes)
  end

end
