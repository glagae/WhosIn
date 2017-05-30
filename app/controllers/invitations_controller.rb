class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:edit, :update, :destroy]

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    authorize @invitation
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
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
