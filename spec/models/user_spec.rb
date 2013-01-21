require 'spec_helper'

describe User do
  it "should succeed creating a new :user from the Factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should succeed creating a second new :user from the Factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should succeed creating a new :admin from the Factory" do
    FactoryGirl.create(:user, :admin=>:true).should be_valid
  end

end
