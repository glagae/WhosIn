class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:edit, :update, :destroy, :show]

  def new
    @menu_item = MenuItem.new
    authorize @menu_item
  end

  def create
    authorize @menu_item
  end

  def edit
    authorize @menu_item
  end

  def update
    authorize @menu_item
  end

  def destroy
    authorize @menu_item
  end



  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
