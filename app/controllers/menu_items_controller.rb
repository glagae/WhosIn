class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update, :destroy, :show]

  def new
    @menu_item = MenuItem.new
    authorize @menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_items_params)
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



  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_items_params
    params.require(:menu_item).permit(:name, :category, :quantity, :event_id)
  end
end
