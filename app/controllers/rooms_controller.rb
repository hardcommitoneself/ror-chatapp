class RoomsController < ApplicationController
  def index
    @currentUser = currentUser

    redirect_to "/signin" unless @currentUser

    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(@currentUser)
  end

  def create
    @room = Room.create(room_params)
  end

  def show
    @currentUser = currentUser
    @singleRoom = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@currentUser)
    @room = Room.new
    @message = Message.new
    @messages = @singleRoom.messages

    render "index"
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end
end
