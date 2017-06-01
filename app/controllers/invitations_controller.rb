class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:edit, :update, :destroy]

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    # @invitation = Invitation.new
    # authorize @invitation
    # data = invitation_params
    # @invitation.user = User.find(data["user_id"].to_i)
    # @invitation.event = Event.find(data["event_id"].to_i)
    # @invitation.role = "guest"
    # @invitation.save

    # redirect_to edit_event_path(@invitation.event)
    @invitation = Invitation.new
    @event = Event.find(params[:event_id])
    authorize @invitation
    params[:friends].each do |friend_id|
      user_invited_id = User.where(uid: friend_id).first.id
      Invitation.create(user_id: user_invited_id, event_id: @event.id, role: "guest")
    end
    redirect_to edit_event_path(@event)
  end

  def edit
    authorize @invitation
  end

  def update
    authorize @invitation
    @event = Event.find(params[:event_id])
    if params[:button] == "in" && @invitation.accepted
      flash[:notice] = "You are already attending! Great motivation :) "
      redirect_to event_path(params[:event_id])
    elsif params[:button] == "in" && (@invitation.accepted == false || @invitation.accepted.nil?)
      if @event.free_spots == 0
        flash[:alert] = "Sorry! The event is already full"
        redirect_to event_path(params[:event_id])
      else
        @invitation.accepted = true
        @invitation.save
        @event.free_spots -= 1
        @event.save
        flash[:notice] = "You are attending! See you soon :) "
        redirect_to event_path(params[:event_id])
      end
    elsif params[:button] == "out" && (@invitation.accepted)
      @invitation.accepted = false
      @invitation.save
      @event.free_spots += 1
      @event.save
      flash[:alert] = " :( Sad! You changed your mind  "
      redirect_to event_path(params[:event_id])
    elsif params[:button] == "out" && (@invitation.accepted == false)
      @invitation.accepted = false
      @invitation.save
      flash[:alert] = " :( Sad!  "
      redirect_to event_path(params[:event_id])
    end
  end

  def destroy
    authorize @invitation
    data = invitation_params
    event = Event.find(data["event_id"].to_i)
    @invitation.destroy

    redirect_to edit_event_path(event)
  end

  private

  def invitation_params
    params.require[:invitation].permit(:user_id, :event_id)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
