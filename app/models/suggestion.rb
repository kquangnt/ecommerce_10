class Suggestion < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category

  enum status: [:processing, :rejected, :accepted]
end
