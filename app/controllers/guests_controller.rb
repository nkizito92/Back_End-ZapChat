class GuestsController < ApplicationController

    def index 
        guests = Guest.all 
        render json: guests, include: [:chats]
    end 

    def show 
        guest = Guest.find_by_id(params[:id])
        render json: guest, include: [:chats]
    end

    def create 
        guest = Guest.find_or_create_by(name: params[:name])
        guest.chats.build({message: params[:message]})
        guest.save
        render json: guest, include: [:chats]
    end 
end
