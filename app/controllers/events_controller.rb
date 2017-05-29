class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  def new
    authorize @event
  end

  def create
    authorize @event
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
