require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、発送料の負担、発送元の地域、発送までの日数、価格が存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像が空では出品できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できないこと' do
        @product.name = ' '
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できないこと' do
        @product.description = ' '
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー(-−-)が存在する場合出品できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態(-−-)が存在する場合出品できないこと' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("State can't be blank")
      end
      it '発送料の負担(-−-)が存在する場合出品できないこと' do
        @product.shipping_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域(-−-)が存在する場合出品できないこと' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数(-−-)が存在する場合出品できないこと' do
        @product.day_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship can't be blank")
      end
      it '価格が空では出品できないこと' do
        @product.price = ' '
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に全角数字が存在する場合出品できないこと' do
        @product.price = '１２３４'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格に全角英語が存在する場合出品できないこと' do
        @product.price = 'ASDF'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格に漢字が存在する場合出品できないこと' do
        @product.price = '数字'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格にカタカナが存在する場合出品できないこと' do
        @product.price = 'スウジ'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格にひらがなが存在する場合出品できないこと' do
        @product.price = 'すうじ'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格に半角英語が存在する場合出品できないこと' do
        @product.price = 'asdf'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格が300￥以下の場合出品できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が9999999以上の場合出品できないこと' do
        @product.price = 999999999
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end