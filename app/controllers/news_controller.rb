class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
  end
  def new
    @news = News.new
  end
  def create
    @news = News.create(news_params)
    if @news.save
      redirect_to :back
      flash[:success] = 'News created'
    else
      redirect_to :back
      flash[:error] = @news.errors.full_messages
    end
  end
  def edit
    @news = News.find(params[:id])
  end
  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to news_path(@news)
      flash[:success] = 'Updated'
    else
      redirect_to :back
      flash[:error] = @news.errors.full_messages
    end
  end
  def destroy
    @news = News.find(params[:id]).delete
    redirect_to :back
    flash[:success] = 'Deleted'
  end

  private

  def news_params
    params.require(:news).permit(:title,:body)
  end
end