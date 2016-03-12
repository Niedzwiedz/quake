class ImagesController < ApplicationController
  respond_to :html, :js
  def index
    @images = Image.paginate(:page => params[:page], :per_page => 2)

    respond_to do |format|
      format.html
      format.json
    end
  end
  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to action: "index"
  end
  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  private
    def image_params
      params.require(:image).permit(:id, :title, :file, :remote_file_url)
    end
end
