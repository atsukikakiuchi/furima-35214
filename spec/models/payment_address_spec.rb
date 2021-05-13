require 'rails_helper'

RSpec.describe PaymentAddress, type: :model do
  describe '購入機能' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @payment_address = FactoryBot.build(:payment_address,user_id: user.id,item_id: item.id)
    sleep 0.1
  end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@payment_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @payment_address.building_name = ""
        expect(@payment_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @payment_address.postal_code = ''
      @payment_address.valid?
      expect(@payment_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @payment_address.prefecture_id = 1
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'manicipalityは空で保存できない' do
        @payment_address.manicipality = ""
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("Manicipality can't be blank")
      end
      it 'house_numberは空では保存できない' do
        @payment_address.house_number = ""
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'tokenは空では登録できない' do
        @payment_address.token = ""
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @payment_address.postal_code = '1234567'
      @payment_address.valid?
      expect(@payment_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberは11桁以下である必要がある' do
        @payment_address.phone_number = '123456789102'
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'user_idが存在しないと登録できない' do
        @payment_address.user_id = ""
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないと登録できない' do
        @payment_address.item_id = ""
        @payment_address.valid?
        expect(@payment_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
