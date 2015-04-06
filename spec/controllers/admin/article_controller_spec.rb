require 'rails_helper'
describe Admin::ArticlesController do
  let(:article) do
    create(:article, title: 'Example article title', text: 'Example title text')
  end

  describe 'GET #new' do
    it "assigns a new Article to @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested article to @article" do
      get :edit, id: article
      expect(assigns(:article)).to eq article
    end

    it "renders the :edit template" do
      get :edit, id: article
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE destroy' do
    it "deletes the article" do
      article
      expect{
        delete :destroy, id: article
      }.to change(Article, :count).by(-1)
    end

    it "redirects to articles#index" do
      delete :destroy, id: article
      expect(response).to redirect_to admin_articles_path
    end
  end

  describe 'GET #show' do
    it "assigns the requested article to @article" do
      get :show, id: article
      expect(assigns(:article)).to eq article
    end

    it "renders the :show template" do
      get :show, id: article
      expect(response).to render_template :show
    end
  end
end