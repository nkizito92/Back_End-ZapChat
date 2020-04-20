class ChatsController < ApplicationController
    def index 
        chats = Chat.all 
        render json: chats, include: [:guest, :comments]
    end 

    def show 
        # comments model needs to belong to chat 
        chat = Chat.find_by_id(params[:id])
        render json: chat, include: [:guest, :comments]
    end

    def create   
        chat = Chat.new(message: chat_params[:message], img: chat_params[:img])
         if !chat_params[:name].nil?
            exsitingGuest = Guest.find_by(name: chat_params[:name])
           if !exsitingGuest.nil? 
            exsitingGuest.chats << chat 
           else 
             chat.build_guest({name: chat_params[:name]})
             chat.save
           end
         end
       render json: chat
    end

    def edit 
        chat = Chat.find_by_id(chat_params[:id])
        render json: chat
    end 

    def update 
        chat = Chat.find_by_id(chat_params[:id])
        chat.update(message: chat_params[:message])
    end 


    def destroy 
        chat = Chat.find_by_id(chat_params[:id])
        chat.delete
    end

    private 
    def chat_params
        params.require("chat").permit(:id, :message, :img, :name)
    end
end
