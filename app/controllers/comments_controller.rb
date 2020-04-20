class CommentsController < ApplicationController
    def show 
        comment = Comment.find_by_id(comment_params[:id])
        render json: comment, include: [:chat, :guest]
    end 

    def create
        if !comment_params[:img]nil?
            comment = Comment.new(img: comment_params[:img])
        elsif !comment_params[:img]nil? && !comment_params[:text]nil?
            comment = Comment.new(img: comment_params[:img], text: comment_params[:text])
        else 
            comment = Comment.new(text: comment_params[:text]
        end
        comment.build_guest({:name comment_params[:name]})
        comment.save 
        render json: comment 
    end

    def update
        comment = Comment.find_by_id(comment_params[:id])
        comment.update(text: comment_params[:text])
        render json: comment, include: [:chat, :guest]
    end 

    def destory 
        comment = Comment.find_by_id(comment_params[:id])
        comment.delete 
    end 
    private
    def comment_params
        params.require("comment").permit(:id, :text, :img, :name)
    end
end
