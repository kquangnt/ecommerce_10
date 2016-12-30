class Category < ApplicationRecord
  acts_as_paranoid
  has_many :products, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.category.name_max_length}
  
  scope :order_date_desc, ->{order created_at: :desc}
end
