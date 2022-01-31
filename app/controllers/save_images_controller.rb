class SaveImagesController < AuthorizationsController
    def index
        @saved_images = current_user.save_images.order(created_at: :desc)
        @user = current_user
        @user_presenter = UserPresenter.new(@user)
    end

    def create
        @save_images = current_user.save_images.new(save_image_params)
        if !@save_images.save
            flash[:notice] = @save_images.errors.full_messages.to_sentence
        end
        redirect_to images_path
    end
    
    def destroy
        @save_images = current_user.save_images.find(params[:id])
        @save_images.destroy

        redirect_to images_path
    end
    
    private

    def save_image_params
        params.require(:save_image ).permit(:image_id)
    end
end
