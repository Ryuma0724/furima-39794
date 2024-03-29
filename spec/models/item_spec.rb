require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品登録' do
    context '新規出品登録できるとき' do
      it 'image, title, content, genre_id, condition_id, charge_id, area_id, leadtime_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nicknameが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'genre_idが空では登録できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'genre_idが「----」では登録できない' do
        @item.genre_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'charge_idが空では登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'charge_idが「-----」では登録できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが「----」では登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'leadtime_idが空では登録できない' do
        @item.leadtime_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Leadtime can't be blank")
      end
      it 'leadtime_idが「----」では登録できない' do
        @item.leadtime_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Leadtime can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceに全角文字が含まれていると登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが9,999,999円以上は出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end