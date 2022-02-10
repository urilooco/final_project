import consumer from "channels/consumer"

// document.addEventListener('turbolinks:load', () => {
const chat_element = document.getElementById('chat-id');
const chat_id = chat_element.getAttribute('data-chat-id');

console.log(consumer.subscriptions)

consumer.subscriptions.subscriptions.forEach((subscription) => {
  consumer.subscriptions.remove(subscription)
})

consumer.subscriptions.create({ channel: "ChatChannel", chat_id: chat_id }, {
  connected() {
    console.log("connected to " + chat_id);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);

    const element = document.getElementById("user-id");
    const user_id = Number(element.getAttribute('data-user-id'));

    let html;

    if(user_id === data.message.user_id) {
      html = data.mine;
    } else {
      html = data.yours;
    }

    const messageContainer = document.getElementById("messages");
    messageContainer.innerHTML = messageContainer.innerHTML + html;
  }
});
// });
