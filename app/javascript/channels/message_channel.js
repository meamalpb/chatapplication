import consumer from "channels/consumer"
import "@hotwired/turbo-rails"


document.addEventListener("turbo:load", ()=> {

  const tokenelement = document.getElementById("ctoken");
  const cid = tokenelement.getAttribute("data-ctoken")

  const uid = tokenelement.getAttribute("data-uid");
  const main_element = document.getElementById("main-header")
  const room_id = main_element.getAttribute("data-room-id");

  console.log("Room id "+room_id)


consumer.subscriptions.create({channel: "MessageChannel",token: cid , uid: uid, room_id: room_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log(`connected to Message channel ${room_id}`)
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    //send message

    const chat = document.getElementById("chat-content");
    if(uid ==  data.user.id){
      chat.innerHTML += '  <div class="flex justify-end mb-4"><div class="message-box sent p-2"><p class="text-xs">'+ data.message.content + '</p></div> </div>';

    }
    else{
      chat.innerHTML += '<div class="flex justify-start mb-4"><div class="message-container"><p class="author text-sm text-gray-500 pl-6">' + data.user.username +'</p><div class="message-box received p-2"><p class="text-xs">'+ data.message.content +'</p></div></div></div>'
    }
    var chatContent = document.getElementById("this");
    chatContent.scrollTop = chatContent.scrollHeight;
    console.log(data);
    const message_form = document.getElementById("message_content");
    message_form.value = '';
    message_form.focus();
  }
});
})