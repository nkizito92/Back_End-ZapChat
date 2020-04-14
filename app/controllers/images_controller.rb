class ImagesController < ApplicationController

    def show 
        image = Image.find_by_id(params[:id])
        render json: image, include: [:chat]
    end

    def create
        image = Image.find_or_create_by(src: params[:src])
        image.chats.build({message: params[:message]})
        image.save
    end
end
