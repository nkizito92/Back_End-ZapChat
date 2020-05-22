class UsersController < ApplicationController
    before_action :define_current_user
    # def index 
    #     users = User.all
    #     render json: users, include: [:chats]
    # end 

    # def login 
    #     user = User.find_by_id(params[:id]) 
    #     render json: user, include: [:chats]
    # end
    # def show 
    #     user = User.find_by_id(params[:id])
    #     render json: user, include: [:chats]
    # end 

    # def loggedin
    #     user = User.find_by(username: user_params[:username])
    #     if user && user.authenticate(user_params[:password])
    #          session[:user_id] = user.id
    #          render json: user, include: [:chats]
    #      else 
    #          render json: {failed: "username or Password is Incorrect"}
    #     end
       
    # end 
    
    # def create 
    #     user = User.create(user_params)
    #     render json: user,  include: [:chats]
    # end 

    # def destroy 
    #     user = User.find_by_id(params[:id])
    #     user.delete
    #     render json: {id: params[:id]}
    # end 

    # def logout
    #     session.clear
    # end

    def create
        user = User.create(user_params)
        render json: user, methods:[ :token ]
    end
    
    def index
        render json: User.all
    end
    
    def show
        render json: current_user
    end
    
    def update
        current_user.update(user_params)
        render json: current_user
    end
    
    def destroy
        current_user.destroy
        render json: current_user
    end

    private 

    def user_params 
        params.require("user").permit(:username, :password, :failed)
    end 

    def define_current_user
        if params[:id]
            @current_user = User.find(params[:id])
        else
            @current_user = User.new
        end
    end
    
    def current_user
        @current_user
    end
end
