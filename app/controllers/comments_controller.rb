class CommentsController < ApplicationController
    include CurrentUserConcern
    def index
        @article = Article.find(params[:article_id])
        comments = @article.comments.all.map do |comment|
            {
                comment: comment,
                commenter: User.find(comment.user_id)
            }
        end
        render json: comments
    end

    

    def create
        if @current_user
            @article = Article.find(params[:article_id])
            @comment = @current_user.comments.create(comment_params)
            @comment.article = @article

            if @comment.save
                render json: {comment: @comment}
            else
                render json: {status: 500}
            end
        else
            render json: {error: "user not log in"}
        end
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            render json: @comment
        else
            render json: {status: 500}
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @current_user == @comment.user
            @comment.destroy
            render json: {status: "successfully deleted"}
        else
            render json: {status: "cannot delete other's comment"}
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
