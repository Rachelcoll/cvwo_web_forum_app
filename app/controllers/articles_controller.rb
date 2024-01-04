class ArticlesController < ApplicationController
    include CurrentUserConcern
    def index
        articles = Article.all.map do |article|
            {
                article: article
            }
        end
        render json: articles
    end

    def show
        @article = Article.find(params[:id])
        if @article
            render json: {article: @article}
        else
            render json: {status: "no such article"}
        end
    end

    def create
        if @current_user
            @article = @current_user.articles.create(article_params)
            if @article
                render json: {article: @article}
            else
                render json: {status: 500}
            end
        else
            render json: {error: "user_not_exist"}
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            render json: {status: "article deleted"}
        else
            render json: {status: 500}
        end
    end


    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            render json: { status: 'success'}
        else
            render json: { status: 500 }
        end
    end

    def personal_article
        if @current_user
            articles = @current_user.articles.all.map do |article|
                {article: article}
            end
            render json: articles
        else
            render json: {status: "you're not logged in"}
        end
    end


    private
    def article_params
        params.require(:article).permit(:title, :tag, :body)
    end
end
