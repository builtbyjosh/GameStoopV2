class UsersController < ApplicationController
    

    def show
        if logged_in?
            redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
            # flash[:errors] = "You can only view your own profile"
        else
            require_login
        end        
    end
    
end