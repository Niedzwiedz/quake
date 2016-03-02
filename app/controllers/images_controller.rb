class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to action: "index"
  end
  def new
    @image = Image.new
  end

  private
    def image_params
      params.require(:image).permit(:title, :file, :remote_file_url)
    end
end
