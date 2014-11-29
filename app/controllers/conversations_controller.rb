class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  layout false
  
  # Create a conversation object
  def create
    # If there is already an existing convo
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else # If conversation is not present
      @conversation = Conversation.create!(conversation_params)
    end
    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
  
=begin 
  def interlocutor(conversation)
    current_user = conversation.recipient ? conversation.sender : conversation.recipient
  end
=end
end
