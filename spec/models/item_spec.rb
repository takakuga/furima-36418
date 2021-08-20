require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品出品ができるとき' do
    it "image,product_name,description,category_id,status_id,postage_id,prefecture_id,day_delivery_id,priceが入力されたら登録できる" do
      expect(@item).to be_valid
    end
    it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
      @item = FactoryBot.create(:user)
      expect(@item).to be_valid
    end
  end

  context '商品出品が出来ないとき' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image.key = ''
      @item.valid?
      expect(@item.errors.full_messages).to include{"Image can't be blank"}
    end
    it "商品名が空だと出品できない" do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it "商品の説明が空では出品できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが未選択(1以外)では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態が未選択(1以外)では出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it '配送料の負担が未選択(1以外)では出品できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it '発送元の地域が未選択(1以外)では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数が未選択(1以外)では出品できない' do
      @item.day_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day delivery must be other than 1")
    end
    it '販売価格が空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が全角数字でないと出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '販売価格が300円以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
   end
  end
end
