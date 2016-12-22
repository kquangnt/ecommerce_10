class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :ativities, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  enum role: [:user, :admin, :manager]
end
