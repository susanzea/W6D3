class UsersController < ApplicationController
    def index
        render plain: "I'm in the index action!"
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end

    require 'byebug'
    def update
        @user = User.find(params[:id])
            debugger
        if @user.(user_params)
            debugger
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

end