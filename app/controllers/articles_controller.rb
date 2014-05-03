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
    
  end

  def update
    
  end

  def destroy
    
  end
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:audio_file,:image_files,:printing_file,:video_file,:hypothesis,:description)
    end

    def check_login
      unless current_user
        redirect_to new_auth_path
      end
    end
end
