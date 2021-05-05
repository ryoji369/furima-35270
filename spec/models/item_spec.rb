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
    it 'categoryが空だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'statusが空だと出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end
    it 'shipping_chargeが空だと出品できない' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
    end
    it 'prefectureが空だと出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'shipping_dateが空だと出品できない' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end
  end
end
