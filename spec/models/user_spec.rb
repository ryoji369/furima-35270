require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報が正しく入力されている場合、登録できる' do
        @user.nickname = 'aaaaaa'
        @user.email = 'test@test'
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        @user.last_name = 'あいうえお'
        @user.first_name = 'かきくけこ'
        @user.last_name_kana = 'アイウエオ'
        @user.first_name_kana = 'カキクケコ'
        @user.birthday = '1900-01-01'
        expect(@user).to be_valid
        
      end

    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailがからだと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank" 
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
      end
      it 'passwordは半角英数字混合、かつ６文字以上でないと登録できない' do
        @user.password = 'aaaaa'
        @user.valid? 
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)", "Password is invalid"
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank" 
      end
      it 'last_nameが漢字・平仮名・カタカナ以外だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid", "First name is invalid"
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが漢字・平仮名・カタカナ以外だと登録できない' do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid", "First name is invalid"
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank" 
      end
      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include  "Last name kana is invalid"
      end 
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank" 
      end
      it 'first_name_kanaが全角カタカナと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include , "First name kana is invalid"
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Birthday can't be blank" 
      end
    end
  end  

end
