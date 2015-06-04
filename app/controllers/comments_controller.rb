class CommentsController < ApplicationController

  # def new
  #   @comment = Comment.new
  # end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      flash[:errors] = "Please try again"
      render(:create)
    end
  end


private

  def comment_params #use this when you get a ActiveModel::ForbiddenAttributesError
    params.require(:comment).permit(:author_name, :body)
  end
end
