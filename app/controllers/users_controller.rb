class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  
  def show
    @user = User.find_by(username: params[:username])
    @user1 = current_user
    # @user1 = User.find(4)
    # @images = @user1.images.order(created_at: :desc)
    @images = @user1.images
  end

  def search
    @users = User.where("username LIKE ?", "%" + params[:username] + "%")
  end  

  def edit
  end

  def update
    current_user.update(user_params)

    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :username, :bio)
  end
end
