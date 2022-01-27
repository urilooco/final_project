class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end
        redirect_to images_path
    end
    
    def destroy
        @like = current_user.likes.find(params[:id])
        image = @like.image
        @like.destroy
    end
    
    private

    def like_params
        params.require(:like).permit(:image_id)
    end
end
