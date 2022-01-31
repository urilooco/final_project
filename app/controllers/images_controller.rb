class ImagesController < AuthorizationsController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      @images = Image.order("RANDOM()").limit(15)
    end

    def show
      @image = Image.find(params[:id])
    end

    def new
      @image = Image.new
    end
    
    def create
      @image = current_user.images.build(image_params)
      if @image.save
        redirect_to image_path(@image.id)
      else
        render :new
      end
    end

    private
  
    def image_params
      params.require(:image).permit(:image, :description)
    end
  end
  