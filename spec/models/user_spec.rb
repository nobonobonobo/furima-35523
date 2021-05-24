require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '保存できる場合' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '保存できない場合' do
      it 'passwordとpassword_confirmationが6文字以上でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user.errors.full_messages).to include
      end
      it 'passwordは、半角英数字が混合されていないと登録できない' do
        @user.password = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'nameは、名字と名前があり、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.family_name = "kana"
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid", "First name is invalid"
      end
      it 'name_rubyは、名字と名前があり、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.family_name_ruby = "kana"
        @user.first_name_ruby = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name ruby is invalid", "First name ruby is invalid"
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end