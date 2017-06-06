class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update, :destroy, :show, :brings]

  def new
    @menu_item = MenuItem.new
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_items_params)
    @event = @menu_item.event
    authorize @menu_item
    if !@menu_item.bring
      @menu_item.invitation = current_user.invitations.where(event_id: menu_items_params["event_id"]).first
      @menu_item.save
      redirect_to edit_event_path(@menu_item.event)
    elsif @menu_item.save
      respond_to do |format|
        format.html { redirect_to events_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def edit
    authorize @menu_item
  end

  def update
    if @menu_item.update(menu_items_params)
      authorize @menu_item
      respond_to do |format|
        format.html { redirect_to edit_event_path(@menu_item.event) }
        format.js
      end
    end

  end

  def destroy
  authorize @menu_item
    if @menu_item.destroy && @menu_item.bring
        respond_to do |format|
        format.html { redirect_to events_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else @menu_item.destroy
      redirect_to edit_event_path(@menu_item.event)
    end
  end
  def brings
    authorize @menu_item
    invitation_of_current_user = current_user.invitations.where(event: params["event_id"]).first
    @menu_item.invitation = invitation_of_current_user
    @menu_item.save
    redirect_to event_path(@menu_item.event)
  end



  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_items_params
    params.require(:menu_item).permit(:name, :category, :quantity, :event_id, :bring)
  end
end
