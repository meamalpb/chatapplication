class PagesController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.all
    if params[:room_id].present? 
      @id = params[:room_id]
      if Room.exists?(@id)
        @croom = Room.find(@id)
        @messages = Room.find(@id).messages
        @message = Message.new
      end
    end
  end
end