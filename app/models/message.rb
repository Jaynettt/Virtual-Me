class Message < ApplicationRecord
    belongs_to :conversation # This is the conversation that the message belongs to
end
