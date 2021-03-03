require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/sample1.png')
  end

  describe "商品出品" do


    context '商品が出品できるとき' do
      it "image,name,information,category,condition,delivery_fee,shipping_area,shipping_day,price,user_idが存在すれば登録できること" do
        expect(@item).to be_valid
      end    
    end
    context '商品が出品できないとき' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'カテゴリー情報が1の場合登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end

      it '商品情報が1の場合登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end

      it '配送料情報が1の場合登録できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
      end

      it '発送元情報が1の場合登録できないこと' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
      end

      it '発送までの情報が1の場合登録できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is out of setting range")
      end

      it '販売価格は半角英数混合では登録できないこと' do
        @item.price = '100a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is out of setting range")
      end

      it '販売価格は半角英語では登録できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is out of setting range")
      end

    end
  end
end
