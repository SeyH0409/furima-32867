require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.build(:user)
      @product = FactoryBot.build(:product)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, product_id: @product.id)
    end

    context '購入できる時' do
      it '必須事項を記載していると購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '購入できない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefectureが空だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @order_address.block = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'postcodeが空では購入できない' do
        @order_address.postcode = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeは-がないと購入できない' do
        @order_address.postcode = "0000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeは-があっても三桁＋四桁でないと購入できない' do
        @order_address.postcode = "000-00000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeが全角数字だと購入できない' do
        @order_address.postcode = "０００-００００"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに-が入っていると購入できない' do
        @order_address.phone_number = "000-0000-0000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角だと購入できない' do
        @order_address.phone_number = "１２３４５６７８９０１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_address.phone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
