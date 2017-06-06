class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:edit, :update, :destroy]
  # after_action :send_invitation, only: [:create]

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    @invitation = Invitation.new
    @event = Event.find(params[:event_id])
    authorize @invitation
    params[:friends].each do |friend_id|
      user_invited_id = User.where(id: friend_id).first.id
      @invitation = Invitation.create(user_id: user_invited_id, event_id: @event.id, role: "guest", accepted: nil)
       InvitationMailer.invited(@invitation, @invitation.event).deliver_now
      @invitation.sent = true
      @invitation.save
    end
    redirect_to edit_event_path(@event)

    # After create method that sends email
    # Try to send FB notif if friend is connected with FB
  end

  def edit
    authorize @invitation
  end

  def update
    authorize @invitation
    @event = Event.find(params[:event_id])
    authorize @event
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
      @invitation.menu_items.each do |item|
          item.invitation = nil
          item.save
       end
      # @invitation.menu_items = []

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
    @invitation.destroy

    redirect_to edit_event_path(@invitation.event)
  end


  def send_invitation(invitation)
    InvitationMailer.invited(invitation, invitation.event).deliver_now
      invitation.sent = true
      invitation.save
  end
  private

  def invitation_params
    params.require[:invitation].permit(:user_id, :event_id)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

end
