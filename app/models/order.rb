class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy 

  enum status: [:processing, :rejected, :accepted]
end
