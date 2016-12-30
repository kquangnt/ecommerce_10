class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  enum role: [:user, :admin, :manager]

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, 
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  scope :order_desc, ->{order created_at: :desc}

  mount_uploader :image, PictureUploader
  validate :image_size
  
  private
  def image_size
    if image.size > Settings.user.image_max_size
      errors.add :image, I18n.t("admin.users.max_size_error")
    end
  end

  def is_user? user
    self == user
  end
end
