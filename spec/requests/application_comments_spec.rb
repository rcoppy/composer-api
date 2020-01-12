require 'rails_helper'

RSpec.describe "ApplicationComments", type: :request do
  describe "GET /application_comments" do
    it "works! (now write some real specs)" do
      get application_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
