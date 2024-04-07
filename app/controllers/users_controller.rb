class UsersController < ApplicationController
  def show
    @user = @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = PostImage.find(post_image_params)
  end
  
  def update
    @user = PostImage.find(post_image_params)
    @user.update
    redirect_to :show
  end 
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
