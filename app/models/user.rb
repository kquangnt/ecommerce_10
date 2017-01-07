class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  enum role: [:user, :admin, :manager]

  validates :name, presence: true, length: {maximum: Settings.user.name_max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/
  validates :email, presence: true, length: {maximum: Settings.user.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :phone_number, presence: true, 
    length: {maximum: Settings.user.phone_number_max_length}, 
    format: {with: VALID_PHONE_NUMBER_REGEX}
  validates :password, presence: true, length: {minimum: Settings.user.min_password},
    allow_nil: true

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
