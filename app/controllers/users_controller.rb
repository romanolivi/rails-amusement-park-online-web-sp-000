class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
        
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to new_user_path
        end
    end

    def show 
        @user = current_user
    end



    private 

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :height, :nausea, :tickets, :admin)
    end

    def require_login
        redirect_to '/' unless session.include? :user_id 
    end
end
