class MessageChannel < ApplicationCable::Channel
  def subscribed
    puts "params: #{params.inspect}"  # Add this line to debug
    if user_logged_in? && params[:room_id].to_i>0
      stream_from "message_channel_#{params[:room_id]}"
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
  def user_logged_in?
    if params[:token]==nil
      return false
    else
      cuser = User.find(params[:uid])
      params[:token] == cuser.cabletoken
    end
  end
end
