class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @user = current_user
    @article = @user.articles.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "article successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article successfully updated!"
      redirect_to  article_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article successfully deleted!"
    redirect_to root_path
  end

  def upvote
    @article = Article.find(params[:id])
    @article.upvote_by current_user
    @articles = Article.all
    redirect_to articles_path
  end

  def downvote
    @article = Article.find(params[:id])
    @article.downvote_by current_user
    @articles = Article.all
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :user_id) ## Rails 4 strong params usage
  end
end
