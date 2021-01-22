class SessionsController < ApplicationController
    def signup
      new_user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "success"
        set_user(@user)
        redirect_to user_path(@user)
      else
        @error = "Please try again."
        render :signup
      end
    end
  
    def login
      new_user
    end  

  def success
    if request.env["omniauth.auth"]  
      @user = User.find_by(uid: request.env["omniauth.auth"]["uid"])
      if @user.nil?
          @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], uid: request.env["omniauth.auth"]["uid"], password: "github")
      end
      set_user(@user)
      redirect_to user_path(@user)
    else
      @user = User.find_by(username: params[:user][:username])        
      if !@user
        binding.pry
          @error = "Account not found. Please try again."
          new_user
          redirect_to login_path
      elsif !@user.authenticate(params[:user][:password])          
          @error = "Password incorrect. Please try again."
          new_user
          redirect_to login_path
      else          
          set_user(@user)
          redirect_to user_path(current_user.id)
      end
    end
  end
  
  def logout
    session.clear
    redirect_to root_path
  end

  def checkout
    @cart = current_cart
    session.delete(:cart_id)
  end
  
  
  private

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def new_user
    @user = User.new
  end

  def set_user(user)
    session[:user_id] = user.id
  end
end