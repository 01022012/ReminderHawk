class PhoneNumber < ActiveRecord::Base

  belongs_to  :event

  validates_format_of :number, :with => /\d{10}/, :message => "Please enter a 10 digit Indian Mobile number"

end
