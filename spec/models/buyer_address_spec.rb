require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, item_id: item.id, user_id: user.id)
      sleep(1)
    end
    
    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されている場合、購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'postal_codeが空だと購入できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeがハイフンを含んだ正しい形式でないと購入できない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefectureが空だと購入できない' do
       @buyer_address.prefecture_id = 1
       @buyer_address.valid?
       expect(@buyer_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空だと購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと購入できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "House number can't be blank"
      end

      it 'telephone_numberが空だと購入できない' do
        @buyer_address.telephone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Telephone number can't be blank"
      end
      it 'telephone_numberが12ケタ以上だと購入できない' do
        @buyer_address.telephone_number = '000000000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Telephone number is invalid"
      end
      it 'telephone_numberが半角英字だと購入できない' do
        @buyer_address.telephone_number = 'aaaaaaaa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Telephone number is invalid"
      end
      it 'telephone_numberが全角数字だと購入できない' do
        @buyer_address.telephone_number = '０００００００'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Telephone number is invalid"
      end
      it 'telephone_numberが半角英数混合だと購入できない' do
        @buyer_address.telephone_number = 'abc123'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Telephone number is invalid" 
      end
      it 'userが紐付いていないと保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと保存できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Item can't be blank" 
      end
      it 'tokenが空では購入できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Token can't be blank"
      end  
    end
  end
end
