class RoomController < ApplicationController
    def create 
        p params
        @room = Room.create(room_params)
        if @room.save
            ActionCable.server.broadcast "main_channel", {room: @room}
            p @room 
        else
            p "Failure"
        end
    end 

    def show 
        @room = Room.new
        @rooms = Room.all
        @messages = Room.find(params[:room_id]).messages
        @message = Room.new
    end

    def create_message
        @message = Message.create(msg_params)
        if @message.save 
            ActionCable.server.broadcast "message_channel_#{@message.room_id}", {message: @message , user: User.find(@message.author_id)}
            p 'Works'  
        else 
            p 'doesnt not work'
        end
    end

    private 
    def room_params
        params.require(:room).permit(:name)
    end

    def msg_params 
        params.require(:message).permit(:content,:author_id,:room_id)
    end

end
