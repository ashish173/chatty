class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  layout false
  
  # This can be a central controller to handle all the chat related routing functionality
  # not necessarilly a conversations thing
  # Create a conversation object
  def create

=begin 
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else # If conversation is not present
      @conversation = Conversation.create!(conversation_params)
    end
=end
    sender_id = params[:sender_id]
    recipient_id = params[:recipient_id]
    
    @conversation = MessagingService::Message.
                      get_conversation(
                        sender_id: sender_id, 
                        recipient_id: recipient_id, 
                        conversation_params: params
                      ).conversation
    render json: { conversation_id: @conversation.id }
  end

  def show
    # @conversation = Conversation.find(params[:id])
    # get conversation from Messeging service
    @conversation = MessagingService::Message.
                      get_conversation(
                        conversation_id: params[:id]
                      ).conversation
    # @reciever = interlocutor(@conversation)
    @reciever = new_interlocutor(@conversation)
    # @messages = @conversation.messages 
    @messages = MessagingService::Message.
                 get_messages_from_conversation(
                   conversation_id: @conversation.id
                 ).messages
    @message = Message.new  # find an alternative for this.
  end

  private
=begin
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
  

  def interlocutor(conversation)
    current_user = conversation.recipient ? conversation.sender : conversation.recipient
  end
=end

  def new_interlocutor(conversation)
    if current_user.id.eql?(conversation.sender_id)
      return User.find(conversation.recipient_id)
    else
      return User.find(conversation.sender_id)
    end
  end
end
