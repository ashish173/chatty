# Methods that I'll be directly be using inside the views
module MessagesHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    conversation_id = message.conversation_id
    conversation = MessagingService::Message.
                      get_conversation(
                        conversation_id: conversation_id).conversation
    recipient_id = message.user_id == conversation.sender_id ? conversation.sender_id : conversation.recipient_id
    User.find(recipient_id)
  end
end
