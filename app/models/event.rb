class Event < ActiveRecord::Base

  belongs_to  :user

  validates_presence_of :user
  validates_presence_of :title, :subject, :start, :end
  has_many  :phone_numbers, :dependent => :destroy
  

  accepts_nested_attributes_for :phone_numbers, 
      :reject_if => lambda { |a| a[:number].blank? }, 
      :allow_destroy => true 

end
