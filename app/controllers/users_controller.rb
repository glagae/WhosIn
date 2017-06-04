class UsersController < ApplicationController
  def index
  end

  def createnewuser
    @user = User.new(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], password: "123456")
    authorize @user
    @user.facebook_picture_url = "https://avatars.io/instagram/username"
    @event = Event.find(user_params[:event_id])
    @user.skip_password_validation = true
    if @user.save
      @invitation = Invitation.create(user: @user, event: @event, role: "guest", accepted: false)

      redirect_to edit_event_path(@event)
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address, :photo, :photo_cache, :event_id)
  end
end
