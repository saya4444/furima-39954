require 'rails_helper'

RSpec.describe OrdersAddresses, type: :model do

  before do
    @orders_addresses = FactoryBot.build(:orders_addresses)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@orders_addresses).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @orders_addresses.building = nil
        expect(@orders_addresses).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @orders_addresses.token = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと登録できない' do
        @orders_addresses.post_code = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンが無いと購入できない' do
        @orders_addresses.post_code = '1234567'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeに全角数字が含まれると購入できない' do
        @orders_addresses.post_code = '１２３-4567'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeが数字以外だと購入できない' do
        @orders_addresses.post_code = 'abc-defg'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Post code is invalid")
      end

      it 'pref_idが選択されていないと購入できない' do
        @orders_addresses.pref_id = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Pref can't be blank")
    end

      it 'pref_idが1だと登録できない' do
        @orders_addresses.pref_id = 1
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Pref must be other than 1")
      end

      it 'municが空だと購入できない' do
        @orders_addresses.munic = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Munic can't be blank")
      end

      it 'addressが空だと購入できない' do
        @orders_addresses.address = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空だと購入できない' do
        @orders_addresses.tel = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telにハイフンがあると購入できない' do
        @orders_addresses.tel = '090-1234-5678'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが10桁または11桁でないと購入できない' do
        @orders_addresses.tel = '123456789'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Tel is invalid")
      end

      it 'telに全角数字が含まれると登録できない' do
        @orders_addresses.tel = '０９０１２３４５６７８'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが数字以外だと登録できない' do
        @orders_addresses.tel = 'abcdefghijk'
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Tel is invalid")
      end

      it 'item_idが空だと購入できない' do
        @orders_addresses.item_id = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空だと購入できない' do
        @orders_addresses.user_id = nil
        @orders_addresses.valid?
        expect(@orders_addresses.errors.full_messages).to include("User can't be blank")
      end

    end
  end










end
