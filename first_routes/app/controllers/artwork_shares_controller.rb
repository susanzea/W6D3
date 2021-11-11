
class ArtworkSharesController < ApplicationController

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if @artwork_share.save
            render json: @artwork_share
        else
            # debugger
            render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy
        render json: @artwork_share
    end

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end