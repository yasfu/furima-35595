require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nick_nameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、dateが存在すれば登録できる' do 
        expect(@user).to be_valid
      end
      it 'nick_nameが存在すれば登録できる' do
        @user.nick_name = "aaaaaaa"
        expect(@user).to be_valid
      end
      it '新しいemailが存在すれば登録できる' do
        @user.email = "bacd@abcd.com"
        expect(@user).to be_valid
      end
      it 'passwordが存在すれば登録できる' do
        @user.password = "abcd12"
        expect(@user).to be_valid
      end
      it 'passwordに半角英数字が存在すれば登録できる' do
        @user.password = "abcd12"
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = "abcd1234"
        @user.password_confirmation = "abcd1234"
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcd12"
        expect(@user).to be_valid
      end
      it 'password_confirmationが存在すれば登録できる' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcd12"
        expect(@user).to be_valid
      end
      it 'password_confirmationに半角英数字が存在すれば登録できる' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcd12"
        expect(@user).to be_valid
      end
      it 'password_confirmationが6文字以上であれば登録できること' do
        @user.password = "abcd123"
        @user.password_confirmation = "abcd123"
        expect(@user).to be_valid
      end
      it 'last_nameが存在すれば登録できる' do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it 'last_nameに漢字が存在すれば登録できる' do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      it 'last_nameにひらがなが存在すれば登録できる' do
        @user.last_name = "やまだ"
        expect(@user).to be_valid
      end
      it 'last_nameにカタカナが存在すれば登録できる' do
        @user.last_name = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'first_nameが存在すれば登録できる' do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it 'first_nameに漢字が存在すれば登録できる' do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it 'first_nameにひらがなが存在すれば登録できる' do
        @user.first_name = "たろう"
        expect(@user).to be_valid
      end
      it 'first_nameにカタカナが存在すれば登録できる' do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
      it 'last_name_kanaが存在すれば登録できる' do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'last_name_kanaにカタカナが存在すれば登録できる' do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it 'first_name_kanaが存在すれば登録できる' do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it 'first_name_kanaにカタカナが存在すれば登録できる' do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it 'dateが存在すれば登録できる' do
        @user.birthday = "1930-02-01"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it 'nick_nameが空では登録できないこと' do
        @user.nick_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに＠が含まれていなければ登録できないこと' do
        @user.email = "bacdabcd.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英語だけでは登録できないこと' do
        @user.password = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが全角英語では登録できないこと' do
        @user.password = "AAAAAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが全角数字では登録できないこと' do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcd13"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが空では登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが半角英語だけでは登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが半角数字だけでは登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが全角英語では登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "ABCDEF"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが全角数字では登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが5文字以下であれば登録できないこと' do
        @user.password = "abcd12"
        @user.password_confirmation = "abcd1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角英語では登録できないこと' do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'last_nameが半角数字では登録できないこと' do
        @user.last_name = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'last_nameが全角数字では登録できないこと' do
        @user.last_name = "１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'last_nameが全角英語では登録できないこと' do
        @user.last_name = "ABC"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角英語では登録できないこと' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'first_nameが半角数字では登録できないこと' do
        @user.first_name = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'first_nameが全角数字では登録できないこと' do
        @user.first_name = "１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'first_nameが全角英語では登録できないこと' do
        @user.first_name = "ABC"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが半角英語では登録できないこと' do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが半角数字では登録できないこと' do
        @user.last_name_kana = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが全角英語では登録できないこと' do
        @user.last_name_kana = "ABS"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが全角数字では登録できないこと' do
        @user.last_name_kana = "１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaが漢字では登録できないこと' do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaがひらがなでは登録できないこと' do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが半角英語では登録できないこと' do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが半角数字では登録できないこと' do
        @user.first_name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが全角英語では登録できないこと' do
        @user.first_name_kana = "ABC"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが全角数字では登録できないこと' do
        @user.first_name_kana = "１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが漢字では登録できないこと' do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaがひらがなでは登録できないこと' do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'dateの指定が無ければ登録できないこと' do
        @user.birthday = "1930-02- "
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end 
    end
  end
end