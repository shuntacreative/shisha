class PhotosController < ApplicationController
  before_action :authenticate_user!

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



private_methods

def photo_params
  params.require(:photo).permit(:title, :image)
end

end