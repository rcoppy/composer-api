require "rails_helper"

RSpec.describe ScoreCommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/score_comments").to route_to("score_comments#index")
    end

    it "routes to #show" do
      expect(:get => "/score_comments/1").to route_to("score_comments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/score_comments").to route_to("score_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/score_comments/1").to route_to("score_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/score_comments/1").to route_to("score_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/score_comments/1").to route_to("score_comments#destroy", :id => "1")
    end
  end
end
