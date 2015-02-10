
class AuthorsController < ApplicationController
  def index
@author=Author.paginate(:per_page => 5, :page => params[:page])
  end

  def new
@author=Author.new
#@author.task.build
  end

  def create
    	params.permit!
   #@author=Author.new(params[:author])
   @author=Author.new(:name=>params[:author][:name],:email=>params[:author][:email])
   respond_to do |format|
   if @author.save
      @image=Image.create(params[:author][:image])
      @image.update_attributes(:entity=>@author)
      format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
                  else
	    format.html { render :new }
        format.json { render json: @authors.errors, status: :unprocessable_entity }
      end
   end
  end
  def show
@author=Author.find(params[:id])
  end
  def edit
    @author=Author.find(params[:id])
  end
  def update
    params.permit!
   @author=Author.find(params[:id])
   if @author.update_attributes(params[:author])
    redirect_to :action=> "index"
    flash[:notice] = "updated Successfully" 
else
  render "new"
  flash[:notice] = "Not Update" 
   end
  end
  def destroy
   @author=Author.find(params[:id])
   if @author.delete
    redirect_to :action=> "index"
    flash[:notice] = "deleted Successfully" 
else
  render "new"
  flash[:notice] = "Not delete" 
   end
  end
  def home
    @image=Image.all
    @product=Product.all
    @author=Author.all
  end
private
def author_params
params.require(:author).permit
end
end
