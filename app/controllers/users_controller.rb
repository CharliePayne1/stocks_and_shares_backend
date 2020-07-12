class UsersController < ApplicationController
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      payload = { user_id: @user.id }
      @token = encode_token(payload)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    @user = current_user
    if @user
      render json: { user: @user, transactions: @user.calculate_transactions, jwt: encode_token(user_id: @user.id) }
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
