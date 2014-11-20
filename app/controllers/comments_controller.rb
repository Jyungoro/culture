class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
      if @comment.save
        flash[:success] = "Comment Created!!"
			  redirect_to @article
      else
        render 'static_page/home'
      end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:article_id, :name, :content)
    end
end
