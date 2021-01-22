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
        flash[:errors] = @user.errors.full_messages
        render :signup
      end
    end
  
    def login
      new_user
    end
  
    # def success
    #   binding.pry
    #   @user = User.find_by(email: params[:user][:email])
    #   if @user && @user.authenticate(user_params[:password])
    #     set_user(@user)
    #     current_cart
    #     redirect_to user_path(@user)
    #   else
    #     flash[:errors] = "Invalid Email or Password"
    #     new_user
    #     render :login
    #   end
    # end

    def success
      if request.env["omniauth.auth"]  
        @user = User.find_by(uid: request.env["omniauth.auth"]["uid"])
        if @user.nil?
            @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], uid: request.env["omniauth.auth"]["uid"], password: "github")
        end
        set_user(@user)
        redirect_to user_path(@user)
    else
        @user = User.find_by(username: params[:username])
        if !@user
            @error = "Account not found. Please try again."
            render :new
        elsif !@user.authenticate(params[:password])
            @error = "Password incorrect. Please try again."
            render :new
        else
            # if it does, "log them in" with the session hash
            # and redirect them to a meaningful place
            set_user(@user)
            redirect_to sequences_path
        # otherwise, re render the login form, displaying a meaningful error
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