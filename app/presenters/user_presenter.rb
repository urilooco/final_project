class UserPresenter
    def initialize(user)
      @user = user
    end

    def profile_image
      return @user.avatar if @user.avatar.attached?

      '/images/no_photo.png'
    end
  end