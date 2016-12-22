class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :suggestions, dependent: :destroy
end
