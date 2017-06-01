class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:edit, :update, :destroy]

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    @invitation = Invitation.new
    authorize @invitation
    data = invitation_params
    @invitation.user = User.find(data["user_id"].to_i)
    @invitation.event = Event.find(data["event_id"].to_i)
    @invitation.role = "guest"
    @invitation.save

    redirect_to edit_event_path(@invitation.event)
  end

  def edit
    authorize @invitation
  end

  def update
    authorize @invitation
    if params[:button] == "in" && @invitation.accepted
      flash[:notice] = "You are already attending! Great motivation :) "
      redirect_to event_path(params[:event_id])
    elsif params[:button] == "in" && (@invitation.accepted == false || @invitation.accepted.nil?)
      @invitation.accepted = true
      @invitation.save
      flash[:notice] = "You are attending! See you soon :) "
      redirect_to event_path(params[:event_id])
    elsif params[:button] == "out" && (@invitation.accepted || @invitation.accepted.nil?)
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
    params.permit(:user_id, :event_id)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
