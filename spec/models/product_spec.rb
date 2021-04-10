require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '出品に成功するとき' do
      it '必須事項が全て埋まっていれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '出品に失敗するとき' do
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空だと出品できない' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空だと登録できない' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'descriptionが1000文字以上だと出品できない' do
        @product.description = 'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅ'
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end
      it 'priceが空だと出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角数字だと登録できない' do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが半角英数混合だと出品できない' do
        @product.price = "1000a"
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが半角英字だと出品できない' do
        @product.price = "threehundred"
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが299以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は300より大きい値にしてください")
      end
      it 'priceが10,000,000以上では出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は9999999より小さい値にしてください")
      end
      it 'quality_idが空だと出品できない' do
        @product.quality_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'category_idが空だと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'delivery_fee_idが空だと出品できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it 'delivery_day_idが空だと出品できない' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it 'userが紐付いてないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end

end
