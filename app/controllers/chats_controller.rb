class ChatsController < ApplicationController
    def index 
        chats = Chat.all 
        render json: chats, include: [:guest, :image]
    end 

    def show 
        chat = Chat.find_by_id(params[:id])
        render json: chat, include: [:guest, :image]
    end

    def create 
       chat = Chat.create(message: params[:message])
       chat.img = params[:img] if !params[:img].nil?
    end

    def edit 
        chat = Chat.find_by_id(params[:id])
    end 

    def update 
        chat = Chat.find_by_id(params[:id])
        chat.update(message: params[:message])
    end 


    def destroy 
        chat = Chat.find_by_id(params[:id])
        chat.delete
    end
end
