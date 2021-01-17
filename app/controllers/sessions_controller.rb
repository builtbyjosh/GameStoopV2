class SessionsController < ApplicationController
    def signup
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "success"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:errors] = @user.errors.full_messages
        render :signup
      end
    end
  
    def login
      new_user
    end
  
    def new
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        current_cart
        redirect_to user_path(@user)
      else
        flash[:errors] = "Invalid Email or Password"
        new_user
        render :login
      end
    end
  
    def logout
      session.clear
      redirect_to root_path
    end
  
  
    private
  
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def new_user
        @user = User.new
    end
  end