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
        comment = Comment.new(img: likeComment_params[:img], text: likeComment_params[:text], chat_id: likeComment_params[:chatId], like: likeComment_params[:like], laugh: likeComment_params[:laugh], angry: likeComment_params[:angry])
        comment.build_guest({name: likeComment_params[:name]})
        comment.save
        render json: comment, include: [:chat, :guest]
    end

    def update
        comment = Comment.find_by_id(params[:id])
        comment.update(text: comment_params[:text], img: comment_params[:img], like: params[:like], laugh: params[:laugh], angry: params[:angry])
        render json: comment, include: [:chat, :guest]
    end

    def destroy 
        comment = Comment.find_by_id(params[:id])
        guest = Guest.find_by_id(comment.guest_id)
        guest.delete
        comment.delete 
        render json: {id: params[:id]}
    end

    private

    def likeComment_params
        params.require("comment").permit(:id, :text, :img, :chatId, :name,:like, :laugh, :angry,:chat_id, :guest_id, :created_at, :updated_at, :chat, :guest)
    end
    def comment_params
        params.require("comment").permit(:id, :text, :img, :name, :chatId, :like, :laugh, :dislike, :angry,:chat_id, :guest_id, :created_at, :updated_at, :chat, :guest)
    end
end
