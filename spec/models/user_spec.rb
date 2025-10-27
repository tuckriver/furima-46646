require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '入力欄が条件を満たし、かつ、空欄がなければ登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end

      it 'lastname_kanjiが半角では登録できない' do
        @user.lastname_kanji = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kanji is invalid. Input full-width characters')
      end

      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end

      it 'firstname_kanjiが半角では登録できない' do
        @user.firstname_kanji = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid. Input full-width characters')
      end

      it 'lastname_katakanaが空では登録できない' do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end

      it 'lastname_katakanaが半角では登録できない' do
        @user.lastname_katakana = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname katakana is invalid. Input full-width katakana characters')
      end

      it 'lastname_katakanaが漢字では登録できない' do
        @user.lastname_katakana = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname katakana is invalid. Input full-width katakana characters')
      end

      it 'lastname_katakanaが平仮名では登録できない' do
        @user.lastname_katakana = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname katakana is invalid. Input full-width katakana characters')
      end

      it 'firstname_katakanaが空では登録できない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end

      it 'firstname_katakanaが半角では登録できない' do
        @user.firstname_katakana = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid. Input full-width katakana characters')
      end

      it 'firstname_katakanaが漢字では登録できない' do
        @user.firstname_katakana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid. Input full-width katakana characters')
      end

      it 'firstname_katakanaが平仮名では登録できない' do
        @user.firstname_katakana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid. Input full-width katakana characters')
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
