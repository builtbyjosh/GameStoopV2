class UsersController < ApplicationController
    

    def show
        if current_user.id == params[:id].to_i
            current_user.id 
        else
            flash[:errors] = "You can only view your profile"
            redirect_to user_path(current_user.id)
        end
    end
    
end