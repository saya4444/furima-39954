require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end

  describe '商品出品機能' do
    context '商品が保存できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end


    context '商品が保存できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像 が空では保存できません")
      end

      it 'itemが空では保存できない' do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名 が空では保存できません")
      end

      it 'explanationが空では保存できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明 が空では保存できません")
      end

      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリー が空では保存できません")
      end

      it 'category_idが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリー は1以外の値にしてください")
      end

      it 'condition_idが空では保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態 が空では保存できません")
      end

      it 'condition_idが1では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態 は1以外の値にしてください")
      end

      it 'burden_idが空では保存できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担 が空では保存できません")
      end

      it 'burden_idが1では保存できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担 は1以外の値にしてください")
      end

      it 'pref_idが空では保存できない' do
        @item.pref_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域 が空では保存できません")
      end

      it 'pref_idが1では保存できない' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域 は1以外の値にしてください")
      end

      it 'period_idが空では保存できない' do
        @item.period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数 が空では保存できません")
      end

      it 'period_idが1では保存できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数 は1以外の値にしてください")
      end

      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格 が空では保存できません")
      end

      it 'priceが299以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格 は300以上9999999以下の数字で設定してください")
      end

      it 'priceが10000000以上だと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格 は300以上9999999以下の数字で設定してください")
      end

      it 'priceが半角数値以外だと保存できない' do
        @item.price = "一二三"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格 は半角数値を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザー が紐付いていないと保存できません')
      end
    end
  end

end









