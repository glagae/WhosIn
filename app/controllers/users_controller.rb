class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    new_params = user_params
    new_params.delete("photo_cache") if new_params["photo_cache"].blank?
    new_params.delete("photo") if new_params["photo"].blank?

    @user.update(new_params)

    if @user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address, :photo, :photo_cache)
  end
end
