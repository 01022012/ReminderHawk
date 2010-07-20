class Company < ActiveRecord::Base
  
  validates_presence_of :subdomain
  validates_presence_of :name
  validates_uniqueness_of :subdomain  

  has_many  :company_users, :dependent => :destroy

  has_many  :users, :through => :company_users
  has_many  :admins, :through => :company_users, :conditions => {:admin => true}
  
end
