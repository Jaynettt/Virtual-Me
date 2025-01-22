class VirtualPersona < ApplicationRecord
  has_one :profile
  has_many :conversations, through: :profile # This is the conversation that the virtual persona belongs to
end
