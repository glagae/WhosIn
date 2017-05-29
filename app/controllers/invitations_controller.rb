class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:edit, :update, :destroy]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
