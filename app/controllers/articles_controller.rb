class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index



    if search_term = params[:search]
      search_term = params[:search].downcase.gsub(/\s+/, "")
      @articles = Article.all.select { |article|
        article.titre.downcase.include?(search_term) ||
          article.description.downcase.include?(search_term)
      }
    else
      @articles = Article.all.order('created_at DESC')
      @nao_articles = Article.where("titre LIKE ?", "%" + 'NAO' + "%")
    end

    @banners = Banner.all

  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to root_path, notice: 'Votre article a été ajouté'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, notice: 'Votre article a été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:titre, :description, :photo, :file)
  end
end
