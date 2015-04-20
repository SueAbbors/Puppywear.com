class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :title, presence: true, uniqueness: true
  validates :price, :stock_quantity, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :stock_quantity, numericality: {only_integer: true}
  
  mount_uploader :image, ProductImageUploader
  
 
end
