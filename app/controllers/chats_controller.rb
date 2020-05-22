class ChatsController < ApplicationController
    before_action :sleeping, only: [:create, :destroy]
    
    def index 
        chats = Chat.all 
        render json: chats, include: [:user, :comments]
    end 

    def show 
        chat = Chat.find_by_id(chat_params[:id])
        render json: chat, include: [:user, :comments]
    end

    def create   
        byebug
        chat = Chat.new(title: chat_params[:title], message: chat_params[:message], img: chat_params[:img])
        # chat.build_guest({name: chat_params[:name]})
        chat.save
        render json: chat,  include: [:user, :comments]
    end 

    def update 
        chat = Chat.find_by_id(chat_params[:id])
        chat.guest.update(name: chat_params[:name])
        render json: chat, include: [:user, :comments]
    end 


    def destroy 
        chat = Chat.find_by_id(params[:id])
        guestIds = chat.comments.map {|gues| gues.guest_id}
        allGuest = guestIds.map {|ids| Guest.find_by_id(ids)}
        chat.guest.delete
        allGuest.map {|g| g.delete}
        chat.comments.delete_all
        chat.delete
        render json: {id: params[:id]}
    end

    private 
    def sleeping
        sleep(2.2)
    end

    def chat_params
        params.require("chat").permit(:id, :message, :img, :title)
    end
end
