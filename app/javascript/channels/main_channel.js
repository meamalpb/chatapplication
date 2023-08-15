import consumer from "channels/consumer"
import "@hotwired/turbo-rails"


document.addEventListener("turbo:load", ()=> {

  const tokenelement = document.getElementById("ctoken");
  const cid = tokenelement.getAttribute("data-ctoken")

  const uid = tokenelement.getAttribute("data-uid")

  console.log("this is the token "+cid);



consumer.subscriptions.create({channel: "MainChannel",main_id: 1, token: cid , uid: uid}, {
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
})