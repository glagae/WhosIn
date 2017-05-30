class EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy, :show]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def edit
    if Event.exists?(params[:id])
      @event = Event.find(params[:id])
    else
      @event = Event.new(start_date: DateTime.new(24/12/2018), end_date: DateTime.new(25/12/2018), address:"Eiffel Tower", title:"My amazing event")
    end
    authorize @event
    @menu_items = @event.menu_items


  end

  def update
    @event = Event.find(params[:id])
    if @event.save
      redirect_to edit_event_path(@event)
    else
      render 'edit'
    end
    authorize @event



  end

  def destroy
    authorize @event

  end

  def show
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
