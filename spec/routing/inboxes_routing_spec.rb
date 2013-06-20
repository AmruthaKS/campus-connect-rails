require "spec_helper"

describe InboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/inboxes").should route_to("inboxes#index")
    end

    it "routes to #new" do
      get("/inboxes/new").should route_to("inboxes#new")
    end

    it "routes to #show" do
      get("/inboxes/1").should route_to("inboxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inboxes/1/edit").should route_to("inboxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inboxes").should route_to("inboxes#create")
    end

    it "routes to #update" do
      put("/inboxes/1").should route_to("inboxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inboxes/1").should route_to("inboxes#destroy", :id => "1")
    end

  end
end
