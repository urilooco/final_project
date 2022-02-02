class CameraController < AuthorizationsController
  def new
    @image = Image.new
  end
end
