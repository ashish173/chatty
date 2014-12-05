class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    # Change this method to use messaging service
    # @conversation = Conversation.find(params[:conversation_id])
    @conversation = MessagingService::Message.get_conversation(conversation_id: params[:conversation_id]).conversation
    # @message = @conversation.messages.build(message_params)
    @message = MessagingService::Message.
                  create_message(
                    conversation_id: @conversation.id,
                    message_params: params['message'],
                    user_id: current_user.id).message
    # @message.user_id = current_user.id   # user_id in message is the user_id of the sender
    # @message.save!
    # find a way to handle this faye path that handles the push for messages
    # currently it doesn't work 
    @path = conversation_path(@conversation)
  end

  private
  # Allow a message json which has body element in json
=begin 
  def message_params
    params.require(:message).permit(:body)
  end
=end
end
