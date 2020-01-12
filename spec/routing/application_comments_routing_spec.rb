require "rails_helper"

RSpec.describe ApplicationCommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/application_comments").to route_to("application_comments#index")
    end

    it "routes to #show" do
      expect(:get => "/application_comments/1").to route_to("application_comments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/application_comments").to route_to("application_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/application_comments/1").to route_to("application_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/application_comments/1").to route_to("application_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/application_comments/1").to route_to("application_comments#destroy", :id => "1")
    end
  end
end
