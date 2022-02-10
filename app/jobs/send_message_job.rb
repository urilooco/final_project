class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    mine = ApplicationController.render(
      partial: "messages/mine",
      locals: { message: message}
    )

    yours = ApplicationController.render(
      partial: "messages/yours",
      locals: { message: message}
    )

    ActionCable.server.broadcast("chat_channel_#{message.chat_id}", { mine: mine, yours: yours, message: message })
  end
end
