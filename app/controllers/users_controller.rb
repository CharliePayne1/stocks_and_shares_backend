class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def create
    @user = User.create(user_params)
    byebug
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    @user = current_user
    render json: { user: @user, jwt: encode_token(user_id: @user.id) }
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
