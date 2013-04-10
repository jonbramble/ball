require 'spec_helper'

describe Meal do
    it "should succeed creating a new :meal from the Factory" do
     FactoryGirl.create(:meal).should be_valid
   end
end
