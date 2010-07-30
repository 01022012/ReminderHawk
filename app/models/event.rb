class Event < ActiveRecord::Base

  belongs_to  :user

  validates_presence_of :user
  validates_presence_of :title, :subject, :start, :end
  has_many  :phone_numbers, :dependent => :destroy
  has_many  :reminders, :dependent => :destroy

  validates_length_of :subject, :in => 4..140
  

  accepts_nested_attributes_for :phone_numbers, 
      :allow_destroy => true 

  accepts_nested_attributes_for :reminders, 
      :allow_destroy => true 

  def validate
    errors.add_to_base "The event cannot end before it starts" if self.end < start
    errors.add_to_base "Event has to start atleast one hour from now" if start < (Time.now + 1.hour)
  end
end
