class ChatsController < ApplicationController
    def index 
        chats = Chat.all 
        render json: chats, include: [:guest]
    end 

    def show 
        chat = Chat.find_by_id(params[:id])
        render json: chat, include: [:guest]
    end

    def create   
        chat = Chat.new(message: chat_params[:message], img: chat_params[:img])
         if !chat_params[:name].nil?
            exsitingGuest = Guest.find_by(name: chat_params[:name])
           !exsitingGuest.nil? ? (exsitingGuest.chats << chat ) : (chat.build_guest({name: chat_params[:name]}) && chat.save)
         end 
       render json: chat
    end

    def edit 
        chat = Chat.find_by_id(params[:id])
        render json: chat
    end 

    def update 
        chat = Chat.find_by_id(params[:id])
        chat.update(message: params[:message])
    end 


    def destroy 
        chat = Chat.find_by_id(params[:id])
        chat.delete
    end

    private 
    def chat_params
        params.require("chat").permit(:message, :img, :name)
    end
end
