class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update, :destroy, :show, :brings]

  def new
    @menu_item = MenuItem.new
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_items_params)
    if !@menu_item.bring
      @menu_item.invitation = current_user.invitations.where(event_id: menu_items_params["event_id"]).first
    end
    authorize @menu_item
    @menu_item.save
    redirect_to edit_event_path(@menu_item.event)
  end

  def edit
    authorize @menu_item
  end

  def update
    @menu_item.update(menu_items_params)
    authorize @menu_item
    redirect_to edit_event_path(@menu_item.event)

  end

  def destroy
    authorize @menu_item
    @menu_item.destroy
    redirect_to edit_event_path(@menu_item.event)
  end

  def brings
    authorize @menu_item
    invitation_of_current_user = current_user.invitations.where(event: params["event_id"]).first
    @menu_item.invitation = invitation_of_current_user
    @menu_item.save
    redirect_to event_path(@menu_item.event)

    # add quantity to invitation to know how much he brings
    # check if this quantity is smaller than total quantity if so update quantity of what to bring
    # update quantity of what is brought
    # menu_item.quantity

  end



  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_items_params
    params.require(:menu_item).permit(:name, :category, :quantity, :event_id, :bring)
  end
end
