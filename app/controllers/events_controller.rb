require 'koala'

class EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy, :show, :addfreespot, :deletefreespot]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.remote_photo_url = "http://via.placeholder.com/350x200"
    if @event.save
      @invitation = Invitation.new
      @invitation.event = @event
      @invitation.user = current_user
      @invitation.role = "manager"
      @invitation.accepted = true
      @invitation.save
      redirect_to edit_event_path(@event)
    else
      render 'pages/home'
    end



  end

  def edit
    @menu_item = MenuItem.new
    @event = Event.find(params[:id])
    authorize @event
    @menu_items = @event.menu_items
    @comment = Comment.new
    @user = User.new

    @fb_friends = Friend.fb_friend_users(current_user)
    @users = User.all - @fb_friends
  end



  def update
    @event = Event.find(params[:id])

    authorize @event
    if !event_params["menu_items_attributes"].nil? && event_params["menu_items_attributes"]["0"]["id"].nil?
      if menu_create(@event, event_params)
        redirect_to edit_event_path(@event)
      else
        render 'edit'
      end
    elsif !event_params["menu_items_attributes"].nil? && !event_params["menu_items_attributes"]["0"]["id"].nil?
      if menu_update(@event, event_params)
        redirect_to edit_event_path(@event)
      else
        render 'edit'
      end
    elsif !event_params[:start_date].nil? || !event_params[:end_date].nil?
      start = event_params[:start_date]
      final = event_params[:end_date]

      if start == "" && final == ""
        if @event.update(address: event_params[:address], title: event_params[:title])
          redirect_to edit_event_path(@event)
        else
          render 'edit'
        end
      elsif start == ""
        if @event.update(address: event_params[:address], title: event_params[:title])
          redirect_to edit_event_path(@event)
        else
          render 'edit'
        end
      else
        start = DateTime.parse(event_params[:start_date])
        if @event.update(start_date: start, address: event_params[:address], title: event_params[:title])
          redirect_to edit_event_path(@event)
        else
          render 'edit'
        end
      end

    else
      if @event.update(event_params)
          redirect_to edit_event_path(@event)
        else
          render 'edit'
        end
    end
  end


  def destroy
    authorize @event
    @event.destroy
    redirect_to root_path
  end

  def show
    authorize @event
    @invitation = current_user.invitations.select { |invitation| invitation.event == @event }.first
    @comment = Comment.new


    # Code used for google map geocoder

    @event = Event.find(params[:id])

    @hash_markers = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def addfreespot
    authorize @event
    @event.free_spots += 1
    respond_to do |format|
      if  @event.save
        format.html { redirect_to edit_event_path(@event) }
        format.js # events/addfreespot.js.erb
      else
        format.html { render 'events/edit' }
        format.js # same think
      end
    end
  end

   def deletefreespot
    authorize @event
    @event.free_spots -= 1
    respond_to do |format|
      if  @event.save
        format.html { redirect_to edit_event_path(@event) }
        format.js # events/addfreespot.js.erb
      else
        format.html { render 'events/edit' }
        format.js # same think
      end
    end
  end


  private

  def event_params
    params.require(:event).permit(
      :start_date,
      :end_date,
      :address,
      :description,
      :title,
      :photo,
      :photo_cache,
      menu_items_attributes: [
        :id,
        :name,
        :category,
        :quantity
        ]
      )
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def menu_create(event, parameters)
    @menu_item = MenuItem.new(event: event)
    @menu_item.name = parameters["menu_items_attributes"]["0"]["name"]
    @menu_item.quantity = parameters["menu_items_attributes"]["0"]["quantity"]
    @menu_item.category = parameters["menu_items_attributes"]["0"]["category"]
    @menu_item.save
  end

  def menu_update(event, parameters)
    @menu_item = MenuItem.where(event: event)
    @menu_item.name = parameters["menu_items_attributes"]["0"]["name"]
    @menu_item.quantity = parameters["menu_items_attributes"]["0"]["quantity"]
    @menu_item.category = parameters["menu_items_attributes"]["0"]["category"]
    @menu_item.save
  end


  def set_datetime(event_params)
    # get start date
    start_yyyy = event_params["start_date(1i)"].to_i
    start_mm = event_params["start_date(2i)"].to_i
    start_dd = event_params["start_date(3i)"].to_i
    start_h = event_params["start_date(4i)"].to_i
    start_min = event_params["start_date(5i)"].to_i
    # get end date
    end_yyyy = event_params["end_date(1i)"].to_i
    end_mm = event_params["end_date(2i)"].to_i
    end_dd = event_params["end_date(3i)"].to_i
    end_h = event_params["end_date(4i)"].to_i
    end_min = event_params["end_date(5i)"].to_i
    # convert to DateTime object
    start_date = DateTime.new(start_yyyy,start_mm,start_dd,start_h,start_min)
    end_date = DateTime.new(end_yyyy,end_mm,end_dd,end_h,end_min)
    # return datetimes
    date = [start_date, end_date]
  end
end
