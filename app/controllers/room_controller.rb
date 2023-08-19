class RoomController < ApplicationController
    def create 
        p params
        @room = Room.create(room_params)
        if @room.save
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
            p 'phew 😄 😀 😃 😁 😆'  
        else 
            p '🤐 🤨 😐 😑 😶'
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
