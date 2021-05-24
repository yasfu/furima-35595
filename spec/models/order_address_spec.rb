require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
      sleep(0.1)
    end

    context '商品購入ができるとき' do
      it 'すべての値が入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは存在しなくても購入できること' do
        @order_address.building = ' '
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが存在しなければ購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空では購入できないこと' do
        @order_address.zip_code = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeに-がないときは購入できないこと' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeに漢字が存在するときは購入できないこと' do
        @order_address.zip_code = '一二三-四五六七'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeにひらがなが存在するときは購入できないこと' do
        @order_address.zip_code = 'あいう-えおかき'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeにカタカナが存在するときは購入できないこと' do
        @order_address.zip_code = 'アイウ-エオカキ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeに半角英語が存在するときは購入できないこと' do
        @order_address.zip_code = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeに全角英語が存在するときは購入できないこと' do
        @order_address.zip_code = 'ABC-DEFG'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zip_codeに全角数字が存在するときは購入できないこと' do
        @order_address.zip_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureが存在しなければ購入できないこと' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できないこと' do
        @order_address.city = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが存在しないときは購入できないこと' do
        @order_address.address = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが存在しないときは購入できないこと' do
        @order_address.phone_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁未満でば購入できないこと' do
        @order_address.phone_number = '1234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上では購入できないこと' do
        @order_address.phone_number = '123456789012'    
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberに全角数字が存在すれば購入できないこと' do
        @order_address.phone_number = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberに全角英語が存在すれば購入できないこと' do
        @order_address.phone_number = 'ABCDEFGHIJK'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberにひらがなが存在すれば購入できないこと' do
        @order_address.phone_number = 'あいうえおかきくけこさ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberにカタカナが存在すれば購入できないこと' do
        @order_address.phone_number = 'アイウエオカキクケコサ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberに漢字が存在すれば購入できないこと' do
        @order_address.phone_number = '一二三四五六七八九十一'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberに半角英語が存在すれば購入できないこと' do
        @order_address.phone_number = 'abcdefghijk'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'user_idが空では購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it  'product_idが空では購入できないこと' do
        @order_address.product_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
