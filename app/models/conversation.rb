class Conversation < ApplicationRecord
    has_many :messages
    has_one :profile # This is the profile of the user who initiated the conversation
end
