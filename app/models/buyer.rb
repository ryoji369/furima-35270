class Buyer < ApplicationRecord
  attr_accessor :token, :price
  has_one :address
  belongs_to :item
  belongs_to :user
  
end
