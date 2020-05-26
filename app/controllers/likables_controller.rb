class LikablesController < ApplicationController
    def show 
        like = Likable.find_by_id(like_params[:id])
        render json: include: [:chat, :comment]
    end

    def create
        like = Likable.find_by_id(like_params[:id])
        render json: include: [:chat, :comment]
    end

    def update
        byebug
        like = Likable.find_by_id(like_params[:id])
        like.update(like_params)
        render json: include: [:chat, :comment]
    end

    private 

    def like_params 
        parmas.require("like").permit(:id, :thumbsup, :laugh, :wow, :dislike, :anger, :likeId)
    end
end
