require 'spec_helper'

describe PhoneNumber do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    PhoneNumber.create!(@valid_attributes)
  end
end
