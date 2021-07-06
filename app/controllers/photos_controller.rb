class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = Photo.all
    @photos = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
    @like = Like.new
  end

def new
  @photo = current_user.photos.new
end

def create
  @photo = current_user.photos.new(photo_params)

  if @photo.save
    redirect_to :root
  else
    render :new
  end
end

def edit
  @photo = Photo.find_by(id: params[:id])
end

def update
  @photo = Photo.find_by(id: params[:id])
  if @photo.update_attributes(photo_params)
    redirect_to "/"
  else
    render action: :edit
  end
end

 def destroy
   @photo = Photo.find(params[:id])
   @photo.destroy
   redirect_to root_path
 end



private_methods

def photo_params
  params.require(:photo).permit(:title, :image)
end

end