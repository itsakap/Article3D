class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  def index
    @articles = Article.all
  end

  def show
    
  end

  def edit
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      #current_user.articles.push(@article)
      #!!!
      redirect_to articles_path
    end
  end

  def update
    if @article.update(article_params)
      #redirect_to SOMETHING!!!
    end
  end

  def destroy
    if current_user
      @article.destroy
      #redirect_to SOMETHING!!!
    end
  end
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:audio_file,:image_files,:printing_file,:video_file,:hypothesis,:description)
    end

    def require_login
      unless current_user
        redirect_to new_auth_path
      end
    end
end
