require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it "token、postal_code、prefecture_id、city、address、phone_numberが存在すれば購入できる" do
        expect(@order_shipping).to be_valid
      end
      it "apartmentは空でも購入できる" do
        @order_shipping.apartment = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it "tokenがからでは購入できない" do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では購入できない" do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeは「3桁ハイフン4桁」の半角文字列以外だと購入できない" do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが選択されていなければ購入できない" do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入できない" do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは10桁以上11桁以内の半角数値以外だと購入できない" do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが9桁以下では購入できない" do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it "phone_numberが12桁以上では購入できない" do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberに半角数字以外が含まれている場合は購入できない" do
        @order_shipping.phone_number = '12a3456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it "userが紐づいていなければ購入できない" do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていなければ購入できない" do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end