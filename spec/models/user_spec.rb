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

      it 'メールアドレスは、@を含めると登録できる' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
    end

    context '保存できない場合' do
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

      it 'passwordとpassword_confirmationが6文字以上でないと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordは、英語のみでは登録できないこと' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      
      it 'passwordは、数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      
      it 'passwordは、全角では登録できない' do
        @user.password = "ａｂｃ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'family_nameは、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameは、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'family_name_rubyが空では登録できない' do
        @user.family_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name ruby can't be blank"
      end

      it 'family_name_rubyは、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.family_name_ruby = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name ruby is invalid"
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name ruby can't be blank"
      end

      it 'first_name_rubyは、全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.first_name_ruby = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name ruby is invalid"
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

      it 'emailに＠がないと登録できない' do
        @user.email = "a.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end