require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '新規出品登録' do
  context '新規出品登録できるとき' do
    it 'title,content,genre_id, condition_id, charge_id, area_id, leadtime_id, priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '新規登録できないとき' do
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
      expect(@item.errors.full_messages).to include("Genre_id can't be blank")
    end
    it 'charge_idが空では登録できない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge_id can't be blank")
    end
    it 'area_idが空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area_id can't be blank")
    end
    it 'leadtime_idが空では登録できない' do
      @item.leadtime_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Leadtime_id can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end