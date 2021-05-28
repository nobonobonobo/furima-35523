require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '出品機能' do
    context '保存できる場合' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@furima).to be_valid
      end
    end

    context '保存できない場合' do
      it 'nameが空では登録できない' do
        @furima.name = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Name can't be blank"
      end

      it 'descriptionが空では登録できない' do
        @furima.description = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが空では登録できない' do
        @furima.category_id = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが空では登録できない' do
        @furima.condition_id = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Condition can't be blank"
      end

      it 'postage_idが空では登録できない' do
        @furima.postage_id = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Postage can't be blank"
      end

      it 'prefecture_id,が空では登録できない' do
        @furima.prefecture_id, = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'shipping_date_id,が空では登録できない' do
        @furima.shipping_date_id, = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Shipping date can't be blank"
      end

      it 'priceが空では登録できない' do
        @furima.price, = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end