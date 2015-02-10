class ImagesController < ApplicationController
def index
	@image=Image.all
end
def new
	@image=Image.new
end
def create
params.permit!
@image=Image.new(params[:image])
  if @image.save
     redirect_to :action => "index"
   else
      render "new"   
  end
end
private
def image_params
params.require(:image).permit(:photo)
end
end
