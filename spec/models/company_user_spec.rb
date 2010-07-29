require 'spec_helper'

describe CompanyUser do
  before(:each) do
  end

  it "should mark the first user admin" do
    user = Factory(:user)
    user.company_users[0].admin.should be_true
  end

  it "should not mark the second user admin" do
    user1 = Factory(:user)
    company = user1.companies[0]

    user2 = Factory(:user, :companies => [company])
    user2.company_users[0].admin.should be_false
  end
end
