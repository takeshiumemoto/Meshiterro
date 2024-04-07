class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
   def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
   end

  def index
    @post_images = PostImage.page(params[:])
  end

  def show
    @post_image = PostImage.find(post_image_params)
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_image = PostImage.find(post_image_params)
    post_image.destroy
    redirect_to :index
  end


private


  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
    
  end
end   
  