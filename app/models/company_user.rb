class CompanyUser < ActiveRecord::Base

  validates_presence_of :user_id, :company_id

  belongs_to  :company
  belongs_to  :user

  def after_create
    # If not an admin, send activation/welcome email
    if company.users.size == 1  # Just the first user created
      self.admin = true
      save
    end
  end

end
