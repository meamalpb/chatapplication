import consumer from "channels/consumer"
import "@hotwired/turbo-rails"


document.addEventListener("turbo:load", ()=> {

  const tokenelement = document.getElementById("ctoken");
  const cid = tokenelement.getAttribute("data-ctoken")

  const uid = tokenelement.getAttribute("data-uid");
  const main_element = document.getElementById("main-header")
  const room_id = main_element.getAttribute("data-room-id");

  console.log("Room id "+room_id)


consumer.subscriptions.create({channel: "MainChannel",token: cid , uid: uid}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected to main channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    //Add room realtime
    const room_list = document.getElementById("room-list")
    room_list.innerHTML += '<p><a href="http://localhost:3000/' + data.room.id + '">'+data.room.name+'</a></p>';
    console.log(data)
  }
});
})