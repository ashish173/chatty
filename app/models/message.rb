class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user   # user_id is the id of user who sent the message

  validates_presence_of :body, :conversation_id, :user_id
end
