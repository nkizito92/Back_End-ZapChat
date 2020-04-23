class CommentsController < ApplicationController
    def index 
        comments = Comment.all 
        render json: comments, include: [:chat, :guest]
    end
    def show 
        comment = Comment.find_by_id(comment_params[:id])
        render json: comment, include: [:chat, :guest]
    end 

    def create
            comment = Comment.new(img: comment_params[:img], text: comment_params[:text], chat_id: comment_params[:chatId])
            comment.build_guest({name: comment_params[:name]})
            comment.save
        render json: comment 
    end

    def update
        comment = Comment.find_by_id(comment_params[:id])
        comment.update(text: comment_params[:text])
        render json: comment, include: [:chat, :guest]
    end 

    def destroy 
        comment = Comment.find_by_id(params[:id])
        comment.delete 
    end

    private
    def comment_params
        params.require("comment").permit(:id, :text, :img, :name, :chatId)
    end
end
