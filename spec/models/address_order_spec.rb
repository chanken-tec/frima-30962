require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item =  FactoryBot.create(:item)
    @address_order = FactoryBot.build(:address_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'Userが存在すれば出品ができる' do
        expect(@user).to be_valid
      end
      it 'post_code, city, address, phone_number, shipping_area_idが存在すれば購入できる' do
        expect(@address_order).to be_valid
      end
      it 'post_codeにハイフンが含まれていれば購入できる' do
        @address_order.post_code = '123-4567'
        expect(@address_order).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @address_order.building_name = ''
        expect(@address_order).to be_valid
      end
      it 'priceとtokenがあれば購入できる' do
        expect(@address_order).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'post_codeが空では購入できない' do
        @address_order.post_code = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'cityが空では購入できない' do
        @address_order.city = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @address_order.address = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @address_order.phone_number = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'shipping_area_idが1では購入できない' do
        @address_order.shipping_area_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Shipping area Select')
      end
      it 'user_idが空では購入できない' do
        @address_order.user_id = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @address_order.item_id = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeにハイフンが含まれていなければ購入できない' do
        @address_order.post_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Post code is invalid')
      end
      it 'tokenが空では購入できない' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @address_order.phone_number = 1234567891011
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが英数字混合では購入できない' do
        @address_order.phone_number = "ab123"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number must be only numbers")
      end
    end
  end
end
