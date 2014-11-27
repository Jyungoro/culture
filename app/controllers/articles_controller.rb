class ArticlesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def show
		@article = Article.find(params[:id])
    @id = params[:id]   
  end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article Created!!"
			redirect_to current_user
		else
			@feed_items =[]
			render 'static_page/home'
		end
	end

	def destroy
		@article.destroy
		redirect_to current_user
	end

	def new
    @article = Article.new
  end

	private
	
	def article_params
		params.require(:article).permit(:title, :content, :image)
	end

	def correct_user
		@article = current_user.articles.find_by(id: params[:id])
		redirect_to current_user if @article.nil?
	end

end
