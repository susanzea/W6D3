
class ArtworksController < ApplicationController

    def index
        # debugger
        if params.has_key?(:user_id)
            # debugger
        # index of nested resource
            @artworks = Artwork.where(artist_id: params[:user_id])
        else
            # debugger
        # index of top-level resource
            @artworks = Artwork.all
        end

        render json: @artworks
    end
    
    # def index
    #     @artworks = Artwork.all
    #     render json: @artworks
    # end

    def create
        @artwork = ArtworkShare.new(artwork_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


end