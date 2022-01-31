class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  
  def show
    @user = User.find_by(username: params[:username])
    @images = @user.images.order(created_at: :desc)
    @saved_image = @user.save_images.order(created_at: :desc)
    @user_presenter = UserPresenter.new(@user)
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
