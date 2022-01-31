class LikesController < AuthorizationsController
    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end
        redirect_to images_path
    end
    
    def destroy
        @like = current_user.likes.find(params[:id])
        @like.destroy

        redirect_to images_path
    end
    
    private

    def like_params
        params.require(:like).permit(:image_id)
    end
end
