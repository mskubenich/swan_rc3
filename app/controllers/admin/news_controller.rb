class Admin::NewsController < AdminController
  def index
    @news = News.all.paginate(page: params[:page],per_page: 5)
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.create(news_params)

    if @news.save
      redirect_to admin_news_index_path
    else
      render 'new'
    end
  end

  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      redirect_to admin_news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    redirect_to admin_news_index_path
  end

  private
  def news_params
    params.require(:news).permit(:title, :body)
  end
end