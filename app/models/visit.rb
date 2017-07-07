class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :plate
end
