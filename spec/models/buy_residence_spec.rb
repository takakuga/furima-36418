require 'rails_helper'

RSpec.describe BuyResidence, type: :model do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  @buy_residence = FactoryBot.build(:buy_residence, user_id: user.id, item_id: item.id)
  sleep(0.5)
end

describe '商品購入' do
  context '必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができること' do
    it 'postal_code,prefecture_id,city,address,building_name,phone_number,token' do
      expect(@buy_residence).to be_valid
    end
    it '建物名は任意であること' do
      @buy_residence.building_name  = ''
      expect(@buy_residence).to be_valid
    end
  end

  context '商品購入が出来ないとき' do
    it '郵便番号が必須であること' do
      @buy_residence.postal_code = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @buy_residence.postal_code = '1234567'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県が必須であること' do
      @buy_residence.prefecture_id = '1'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が必須であること' do
      @buy_residence.city = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it '番地が必須であること' do
      @buy_residence.address = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @buy_residence.phone_number = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号は、12桁以上半角数値は保存不可なこと' do
      @buy_residence.phone_number = '0901122233333'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @buy_residence.phone_number = '090-1234-4321'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid.")
    end
    it '電話番号は、9桁以下の半角数値は保存不可なこと' do
      @buy_residence.phone_number = '090111333'
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid.")
    end
    it 'use_idがないと購入できない' do
      @buy_residence.user_id = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idがないと購入できない' do
      @buy_residence.item_id = ''
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @buy_residence.token = nil
      @buy_residence.valid?
      expect(@buy_residence.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end
