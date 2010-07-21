class Event < ActiveRecord::Base

  belongs_to  :user

  validates_presence_of :user
  validates_presence_of :title, :subject, :start, :end

end
