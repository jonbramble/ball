require "spec_helper"

describe HomeController do
  describe "routing" do

    it "routes to #index" do
      get("/home/index").should route_to(:controller => "home", :action=>"index")
    end

    it "routes to #index from home only" do
      get("/home").should route_to(:controller => "home", :action=>"index")
    end

    it "routes root to home#index" do
      get("/").should route_to(:controller => "home", :action=>"index")
    end

  end
end
