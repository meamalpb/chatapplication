import consumer from "channels/consumer"

consumer.subscriptions.create({channel: "MainChannel",main_id: 0}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected to main channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
