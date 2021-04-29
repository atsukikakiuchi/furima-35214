require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context 'ユーザーの新規登録ができる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは六文字以上で登録できる' do
        @user.password = 'a0a0a0'
        @user.password_confirmation = 'a0a0a0'
        expect(@user).to be_valid
      end
    end
   context 'ユーザーの新規登録ができない時' do
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
    it 'emailが一意性でないと登録できない' do
      another_user = @user.dup
      another_user.email = @user.email.upcase
      @user.save
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailが＠が含まれていないと登録できない' do
      @user.email = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordがからでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordか六文字以下では登録できない' do
      @user.password = 'a0a0a'
      @user.password_confirmation = 'a0a0a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'ａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは確認用と二回入力する必要がある' do
      @user.password = '0a0a0a'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password（確認用）は値の一致が必要である' do
      @user.password = '0a0a0a'
      @user.password_confirmation = '0b0b0b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は、苗字が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'ユーザーの苗字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end
    it 'ユーザー本名のふりがなは、苗字が必須であること' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_katakana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
    end
    it 'ユーザー苗字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_katakana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
