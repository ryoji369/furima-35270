class Item < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

 with_options presence: true do
  validates :name
  validates :text
  validates :category_id
  validates :price, format: { with: /\A[0-9]+\Z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } 
  validates :status_id
  validates :shipping_charge_id
  validates :shipping_date_id
  validates :prefecture_id
  validates :image
 end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :prefecture
   
 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :shipping_date_id
  validates :prefecture_id
 end
end



