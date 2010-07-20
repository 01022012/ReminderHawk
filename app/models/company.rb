class Company < ActiveRecord::Base
  
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain  


end
