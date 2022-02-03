class ImagesController < AuthorizationsController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :find_image, only: %i[ show destroy ]

    def index
      @images = Image.order("RANDOM()").limit(15)
    end

    def show
      @user_presenter = UserPresenter.new(@image.user)
    end

    def new
      @image = Image.new
    end
    
    def create
      @image = current_user.images.build(image_params)
      if @image.save
        redirect_to image_path(@image.id)
      else
        flash[:notice] = @image.errors.full_messages.to_sentence
      end
    end

    def destroy
      @image.destroy
      respond_to do |format|
        format.html { redirect_to images_path, notice: "Image was successfully destroyed." }
      end
    end

    private

    def find_image
      @image = Image.find(params[:id])
    end
  
    def image_params
      params.require(:image).permit(:image, :description)
    end
  end
  