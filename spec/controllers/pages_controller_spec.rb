require 'rails_helper'

describe PagesController, type: :controller do

  describe "pages" do
    it "it should correctly render home page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
