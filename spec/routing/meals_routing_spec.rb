require "spec_helper"

describe MealsController do
  describe "routing" do

    it "routes to #edit" do
      get("/users/1/meals/2/edit").should route_to(:controller => "meals", :user_id=>"1", :action=> "edit", :id => "2")
    end

    it "routes to #update" do
      put("/users/1/meals/2").should route_to(:controller => "meals", :user_id=>"1", :action=> "update", :id => "2")
    end

  end
end
