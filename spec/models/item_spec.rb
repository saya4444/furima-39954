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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'itemが空では保存できない' do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end

      it 'explanationが空では保存できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが空では保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが1では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'burden_idが空では保存できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it 'burden_idが1では保存できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it 'pref_idが空では保存できない' do
        @item.pref_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref can't be blank")
      end

      it 'pref_idが1では保存できない' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref must be other than 1")
      end

      it 'period_idが空では保存できない' do
        @item.period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end

      it 'period_idが1では保存できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period must be other than 1")
      end

      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10000000以上だと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが半角数値以外だと保存できない' do
        @item.price = "一二三"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end

end









