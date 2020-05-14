class UsersController < ApplicationController
    def index 
        users = User.all
        render json: users, include: [:chats]
    end 

    def show 
        exiting = current_user
    end 
    
    def create 
        user = User.create(user_params)
        session[:user_id] = user.id
        render json: user,  include: [:chats]
    end 

    def destroy 
        user = User.find_by_id(params[:id])
        user.delete
        render json: {id: params[:id]}
    end 

    def logout
        session.clear
    end

    private 

    def user_params 
        params.require("user").permit(:username, :password)
    end 
end
