class RoomsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_room, only: [:show, :update, :edit]

  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])

    @photos = @room.photos
    #@photos = Room.photos.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(set_params)

    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(:image => image)
        end
      end

      @photos = @room.photos

      flash[:notice]= "Success !"
      #redirect_to edit_room_path(@room), notice: " Saved! "
    else
      render :new
    end
  end

  def edit

    if @room.try(:user_id) && current_user.id ==  @room.user_id
      @photos = @room.photos
    else
      #redirect_to root_path, notice: "?!"
    end
  end

  def update
    if @room.update(set_params)

      if @room.save
        if params[:image]
          params[:image].each do |image|
            @room.photos.create(image: image )
          end
        end

        redirect_to edit_room_path(@room), notice: " Saved! "
      else
        render :edit
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_params
    params.require(:room).permit(:home_type, :room_type, :summary, :accommodate, :bed_room, :bath_room, :is_TV,
      :is_WiFi, :price)
  end
end
