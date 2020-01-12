require 'rails_helper'

RSpec.describe "ScoreComments", type: :request do
  describe "GET /score_comments" do
    it "works! (now write some real specs)" do
      get score_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
