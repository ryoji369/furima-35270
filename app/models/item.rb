class Item < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_date, presence: true
  validates :prefecture_id, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :prefecture
   

  validates :category_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_date_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 

end
