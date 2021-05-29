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
        @furima.prefecture_id = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'shipping_date_id,が空では登録できない' do
        @furima.shipping_date_id = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Shipping date can't be blank"
      end

      it 'priceが空では登録できない' do
        @furima.price = ""
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが299円以下では出品できない' do
        @furima.price = 299
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'priceが10,000,000円以上では出品できない' do
        @furima.price = 10000000
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'priceが、英数字混合では出品できない' do
        @furima.price = "abcdef"
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price is not a number"
      end
      
      it 'imageが空では登録できない' do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Image can't be blank"
      end

      it 'category_idが１のときは出品できない' do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Category must be other than 1"
      end

      it 'prefecture_idが１のときは出品できない' do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'condition_idが１のときは出品できない' do
        @furima.condition_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Condition must be other than 1"
      end

      it 'shipping_date_idが１のときは出品できない' do
        @furima.shipping_date_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Shipping date must be other than 1"
      end

      it 'postage_idが１のときは出品できない' do
        @furima.postage_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Postage must be other than 1"
      end
    end
  end
end