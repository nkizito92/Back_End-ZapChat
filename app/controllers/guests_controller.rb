class GuestsController < ApplicationController

    def index 
        guests = Guest.all 
        render json: guests, include: [:chats]
    end 

    def show 
        guest = Guest.find_by_id(guest_params[:id])
        render json: guest, include: [:chats]
    end

    def create 
        byebug
        guest = Guest.create(guest_params)
        render json: guest, include: [:chats]
    end

    def update 
        guest = Guest.find_by_id(guest_params[:id])
        guest.update(name: guest_params[:name])
        render json: guest, include: [:chats]
    end 
    private 
    def guest_params
        params.require("guest").permit(:name, :id)
    end
end
