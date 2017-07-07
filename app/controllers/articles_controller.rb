class ArticlesController < ApplicationController
  
  # get /articles/my_articles
  def my_articles

    @articles = Article.where(:user_id => current_user.id ).load;
    puts @articles.inspect
    render 'index'
  end
  def show

    @article = Article.find(params[:id])
  end
  def index
    @articles = Article.where(:state => 'public')
    render 'index'
  end
  def new
    @article  = Article.new
  end
  def edit

    @article = Article.find(params[:id])
    if current_user.id != @article.user_id
        redirect_to '/articles'
    else
      render 'edit'
    end
  end
  def update

    @article = Article.find(params[:id])
    if current_user.id != @article.user_id
        redirect_to '/articles'
    else
        if @article.update(article_params)
          redirect_to '/articles'
        else
          render 'edit'
        end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    puts @article.inspect
    @article.destroy
    redirect_to '/articles'
  end

  def create

    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to '/articles'
    else
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :state, :image)

    end
end
