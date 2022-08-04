require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
    end

    context '入力に問題がない場合' do
      it 'すべてが正しく入力されていると商品を購入できる'do
        expect(@purchase).to be_valid
      end

      it '建物名が空欄でも購入できる' do
        @purchase.buildings = ''
        expect(@purchase).to be_valid
      end
    end

    context '入力に問題がある場合' do
      it '郵便番号が入力されていないと購入できない'do
       @purchase.post_code = ''
       @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it '3ケタの半角数字,+,4ケタの半角数字という表記以外の郵便番号以外は入力できない'do
       @purchase.post_code = 1234567
       @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が入力されていないと購入できない' do
        @purchase.prefectures_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '市区町村が入力されていないと購入できない' do
        @purchase.municipalities = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が入力されていないと購入できない' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が入力されていないと購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it '半角数字でない電話番号は入力できない' do
        @purchase.phone_number = "abcdefg"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it '12文字以上の電話番号は入力できない' do
        @purchase.phone_number = 123456789000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it '9文字以下の電話番号は入力できない' do
        @purchase.phone_number = 12345678
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it'トークンがないと購入できない'do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
