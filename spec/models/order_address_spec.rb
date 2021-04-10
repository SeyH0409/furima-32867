require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, product_id: @product.id)
      sleep 0.1   
    end

    context '購入できる時' do
      it '必須事項を記載していると購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '購入できない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'prefectureが空だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと購入できない' do
        @order_address.block = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'postcodeが空では購入できない' do
        @order_address.postcode = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeは-がないと購入できない' do
        @order_address.postcode = "0000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postcodeは-があっても三桁＋四桁でないと購入できない' do
        @order_address.postcode = "000-00000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postcodeが全角数字だと購入できない' do
        @order_address.postcode = "０００-００００"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberに-が入っていると購入できない' do
        @order_address.phone_number = "000-0000-0000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角だと購入できない' do
        @order_address.phone_number = "１２３４５６７８９０１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_address.phone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが英字のみだと購入できない' do
        @order_address.phone_number = "abcdefghijk"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが英数混合だと購入できない' do
        @order_address.phone_number = "123456789ab"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'product_idが空だと購入できない' do
        @order_address.product_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("商品を入力してください")
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end
