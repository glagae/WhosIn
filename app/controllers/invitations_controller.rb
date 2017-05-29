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
  end

  def destroy
    authorize @invitation
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
