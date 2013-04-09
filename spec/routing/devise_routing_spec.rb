require "spec_helper"

describe DeviseController do
  describe "routing" do

    it "routes to sign in" do
      get("/users/sign_in").should route_to(:controller => "devise/sessions", :action=>"new")
    end

    it "routes to sign out" do
      get("/users/sign_out").should route_to(:controller => "devise/sessions", :action=>"destroy")
    end

  end
end
