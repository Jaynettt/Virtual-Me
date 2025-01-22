class Profile < ApplicationRecord
   belongs_to :conversation # This is the conversation that the profile belongs to
end
