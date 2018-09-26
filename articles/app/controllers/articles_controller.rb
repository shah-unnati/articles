class ArticlesController < ApplicationController
def index
	@articles = Article.order(:text)
    	respond_to do |format|
      	format.html
      	format.csv { send_data @articles.to_csv }
      	format.xls
	end
end
def new
end
def create
  @article = Article.new(article_params)

  ap @article

  ap article_params
  @article.save
  redirect_to @article
end
 private
  def article_params
    params.require(:article).permit(:title, :text)
  end

public
  def show
  @article = Article.find(params[:id])
  ap @article
  end
end