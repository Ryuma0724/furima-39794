require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_order = FactoryBot.build(:address_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @address_order.building = ''
        expect(@address_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できないこと' do
        @address_order.zip_code = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_order.zip_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @address_order.area_id = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが「----」では保存できないこと' do
        @address_order.area_id = '1'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @address_order.municipality = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @address_order.street = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address_order.phone_number = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9ケタ以下だと保存できないこと' do
        @address_order.phone_number = '090123456'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12ケタ以上だと保存できないこと' do
        @address_order.phone_number = '090123456789'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数値でないと保存できないこと' do
        @address_order.phone_number = '９９９９９９９９９９'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @address_order.token = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @address_order.user_id = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @address_order.item_id = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Item can't be blank")
      end
    end  
  end
end
