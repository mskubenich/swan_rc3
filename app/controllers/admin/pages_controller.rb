class Admin::PagesController < AdminController
	
  def index
  	@users = User.all
  end
end
