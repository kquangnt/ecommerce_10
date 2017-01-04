class Product < ApplicationRecord
  acts_as_paranoid
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, 
    length: {maximum: Settings.product.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.product.description_max_length}
  validates :price, presence: true, numericality: {only_integer: true}
  validate :image_size

  mount_uploader :image, PictureUploader
  
  delegate :name, to: :category, prefix: true, allow_nil: true
 
  scope :order_date_desc, ->{order created_at: :desc}
  scope :filter_category, ->category_id do
    where category_id: category_id if category_id.present?
  end
  
  private
  def image_size
    if image.size > Settings.product.image_max_size
      errors.add :image, I18n.t("admin.products.max_size_error")
    end
  end
end
