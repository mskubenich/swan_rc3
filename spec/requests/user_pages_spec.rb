require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      get user_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
end
