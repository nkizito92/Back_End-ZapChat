class ChatsController < ApplicationController
    before_action :sleeping, only: [:create, :destroy]
    before_action :found_chat, only: [:show, :update]
    
    def index 
        chats = Chat.all 
        render json: chats, include: [:guest, :comments]
    end 

    def show 
        render json: chat, include: [:guest, :comments]
    end

    def create   
        chat = Chat.new(message: chat_params[:message], img: chat_params[:img])
        chat.build_guest({name: chat_params[:name]})
        chat.save
        render json: chat,  include: [:guest, :comments]
    end 

    def update 
        chat.update(message: chat_params[:message])
        render json: chat, include: [:guest, :comments]
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
    def found_chat
        chat = Chat.find_by_id(chat_params[:id])
    end

    def sleeping
        sleep(2.2)
    end

    def chat_params
        params.require("chat").permit(:id, :message, :img, :name)
    end
end
