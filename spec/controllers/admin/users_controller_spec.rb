require 'rails_helper'

describe Admin::UsersController, :type => :controller do
  before do
    @user1 = create :user
    @user2 = create :user
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the users into @users" do
      get :index
      expect(assigns(:users)).to match_array([@user1, @user2])
    end
  end

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      get :show, id: @user1
      expect(assigns(:user)).to eq @user1
    end

    it "renders the :show template" do
      get :show, id: @user1
      expect(response).to render_template('show')
    end
  end
end
