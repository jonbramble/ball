require "spec_helper"

describe Admin::UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin").should route_to(:controller => "admin/users", :action=>"index")
    end

    it "routes to #new" do
      get("/admin/users/new").should route_to(:controller => "admin/users", :action=> "new")
    end

    it "routes to #index" do
      get("/admin/users").should route_to(:controller => "admin/users", :action=> "index")
    end

    it "routes to #show" do
      get("/admin/users/1").should route_to(:controller => "admin/users", :action=> "show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/users/1/edit").should route_to(:controller => "admin/users", :action=> "edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/users/").should route_to(:controller => "admin/users", :action=> "create")
    end

    it "routes to #update" do
      put("/admin/users/1").should route_to(:controller => "admin/users", :action=> "update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/users/1").should route_to(:controller => "admin/users", :action=> "destroy", :id => "1")
    end

  end
end
