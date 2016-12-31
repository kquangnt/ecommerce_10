class Suggestion < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category

  enum status: [:processing, :rejected, :accepted]

  scope :order_date_desc, ->{order created_at: :desc}

  mount_uploader :image, PictureUploader
end
