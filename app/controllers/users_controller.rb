class UsersController < ApplicationController
	before_action :signed_in_user, only: :show


	def index
   #@articles = Article.order("created_at")
    @articles = Article.paginate(page: params[:page], per_page: 8)
    @comments = Comment.paginate(page: params[:page], per_page: 8).reverse_order
	end

  def show
  	@id = params[:id]
   	@user = User.find(@id)
  	@articles = @user.articles.paginate(:page => params[:page], :per_page => 4)
  	  	@article = current_user.articles.build if signed_in?
  end

  def new
  end
end
