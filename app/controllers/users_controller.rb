class UsersController < ApplicationController
    

    def show
        if logged_in?
            redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
            # flash[:errors] = "You can only view your own profile"
        else
            require_login
        end        
    end

    def edit

    end

    def update
        current_user.update(update_params)
        redirect_to user_path(current_user)
    end

    private

    def update_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
end