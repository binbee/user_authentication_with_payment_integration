class ProductsController < ApplicationController
  include ProductsHelper
  include BraintrreNonse
  def index
  @product=Product.all
  end
def seo_url
@product=Product.find_by_id_and_title(params[:id],params[:product_name])
if @product.present?
  redirect_to :action=> "show"
  else
   redirect_to :action=>"index"
end

end
  def new
  @product=Product.new
  end
  def create
  	params.permit!
  	@product=Product.new(:title=>params[:product][:title],:descripti=>params[:product][:descripti],:price=>params[:product][:price])
    if @product.save
      @image=Image.create(params[:product][:image])
      @image.update_attributes(:entity=>@product)
       redirect_to :action=>"index"
    else
	   render "new"
    end
  end
  
  def add_image
    @product=Product.find(params[:id])
  end
  def save_image
  params.permit!
    @image=Image.new(params[:product])
    byebug
    if @image.save
       @image.update_attributes(:entity=>Product.find(params[:id]))
       redirect_to :action=>"index"
    else
       redirect_to :action=>"new"
    end  
end
def show
@product=Product.find(params[:id])
end
  private
  def product_params
params.require(:product).permit
  end
end
