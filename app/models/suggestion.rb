class Suggestion < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category

  enum status: [:processing, :rejected, :accepted]

  scope :order_date_desc, ->{order created_at: :desc}

  mount_uploader :image, PictureUploader
  
  mount_uploader :image, PictureUploader
  validate :image_size
  validates :product, presence: true, 
    length: {maximum: Settings.suggestion.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.suggestion.description_max_length}
  validates :category_id, presence: true
  validates :user_id, presence: true

  private
  def image_size
    if image.size > Settings.suggestion.image_max_size
      errors.add :image, I18n.t("suggestions.max_size_error")
    end
  end
end
