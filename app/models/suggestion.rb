class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum status: [:processing, :rejected, :accepted]
end
