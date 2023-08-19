class PagesController < ApplicationController
  def index
    puts params
    @room = Room.new
    @rooms = Room.all
    if params[:room_id].present? 
      @id = params[:room_id]
      if Room.exists?(@id)
        @croom = Room.find(@id)
        @messages = Room.find(@id).messages
        @message = Message.new(author_id: current_user.id, room_id: @id)
      end
    end
  end
end