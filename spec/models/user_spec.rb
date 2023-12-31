require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation, family_name、given_name, family_name_kana, given_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'given_nameが空では登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'given_name_kanaが空では登録できない' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'family_nameに半角文字が含まれていると登録できない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it 'given_nameに半角文字が含まれていると登録できない' do
        @user.given_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name 全角文字を使用してください")
      end
      it 'family_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
        @user.family_name_kana = '山た1test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end
      it 'given_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
        @user.given_name_kana = '山た1test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana 全角カタカナを使用してください")
      end
      it 'passwordに半角英字のみでは登録できない' do
        @user.password = 'abcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordに半角数字のみでは登録できない' do
        @user.password = '123123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordに全角文字は登録できない' do
        @user.password = '山田あいうえ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
    end
  end
end