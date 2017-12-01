class CommentsController < ApplicationController

  def new
    @user = current_user
    @comment = @user.comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @articles = @comment.articles
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully updated!"
      redirect_to  comment_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted!"
    redirect_to root_path
  end

private
  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end
end
