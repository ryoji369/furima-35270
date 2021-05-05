class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A([ァ-ン]|ー)+\z/ 

 with_options presence: true do
  validates :nickname
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, format: { with: VALID_NAME_REGEX }
  validates :first_name, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
  validates :birthday
 end
 
 has_many :items
end

