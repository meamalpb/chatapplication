class MainChannel < ApplicationCable::Channel
  def subscribed
    puts BCrypt::Password.create("kumar")
    puts "params: #{params.inspect}"  # Add this line to debug
    if params[:main_id] == 1
      stream_from "main_channel"
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
