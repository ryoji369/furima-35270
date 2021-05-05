require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it 'すべての情報が正しく入力されている場合、出品できる' do
    expect(@item).to be_valid
    end
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'textが空だと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが全角文字では登録できない' do
      @item.price = 'あいうえお'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceが英数字混合では登録できない' do
      @item.price = 'abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceが半角数字でなければ登録できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceが299以下の場合は保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it 'priceが10,000,000以上の場合は保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it 'categoryが空だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it 'statusが空だと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end
    it 'shipping_chargeが空だと出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge must be other than 1"
    end
    it 'prefectureが空だと出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it 'shipping_dateが空だと出品できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date must be other than 1"
    end
  end
end
