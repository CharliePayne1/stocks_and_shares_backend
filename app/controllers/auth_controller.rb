class AuthController < ApplicationController
  
    def login
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        payload = encode_token({ user_id: @user.id, username: @user.username })
        render json: { user: @user, transactions: @user.calculate_transactions, jwt: payload }, status: :accepted
      else
        render json: { message: "Invalid username or password" }, status: :not_acceptable
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:username, :password)
    end
  end