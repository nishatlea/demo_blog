class CommentsController < ApplicationController
  before_action :set_article,  only: [:create, :edit, :update, :destroy]



  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
    @comment = Comment.find(params[:id])
    puts @comment
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    # @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article.id)


    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end






  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
  def set_article
    @article = Article.find(params[:article_id])
  end
end
