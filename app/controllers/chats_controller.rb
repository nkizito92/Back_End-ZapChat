class ChatsController < ApplicationController
    before_action :sleeping, only: [:create, :destroy]
    
    def index 
        chats = Chat.all 
        render json: chats, include: [:guest, :comments]
    end 

    def show 
        chat = Chat.find_by_id(chat_params[:id])
        render json: chat, include: [:guest, :comments]
    end

    def create   
        chat = Chat.new(likeChat_params)
        chat.build_guest({name: chat_params[:name]})
        chat.save
        render json: chat,  include: [:guest, :comments]
    end 

    def update 
        # byebug
        if !params[:chatId].nil?
            chat = Chat.find_by_id(params[:chatId][:id])
            chat.guest.update(name: params[:chatId][:name])
        else
            chat = Chat.find_by_id(params[:id])
            chat.update(like: params[:like], laugh: params[:laugh], angry: params[:angry])
        end 
        render json: chat, include: [:guest, :comments]
    end 


    def destroy 
        chat = Chat.find_by_id(params[:id])
        guestIds = chat.comments.map {|gues| gues.name}
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
        params.require("chat").permit(:id, :message, :img, :name, :like, :laugh, :angry)
    end

    def likeChat_params
        params.require("chat").permit(:id, :message, :img, :like, :laugh, :angry)
    end
end
