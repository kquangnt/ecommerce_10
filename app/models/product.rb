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
   
  scope :order_date_desc, ->{order created_at: :desc}

  mount_uploader :image, PictureUploader
  validate :image_size
  
  private
  def image_size
    if image.size > Settings.product.image_max_size
      errors.add :image, I18n.t("admin.products.max_size_error")
    end
  end
end
