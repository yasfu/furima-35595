require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nick_nameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、dateが存在すれば登録できる' do
      
    end
    it 'nick_nameが存在すれば登録できる' do
      
    end
    it 'nick_nameが空では登録できないこと' do
      
    end
    it '新しいemailが存在すれば登録できる' do
      
    end
    it 'emailが空では登録できないこと' do
      
    end
    it '重複したemailが存在する場合登録できないこと' do
      
    end
    it 'emailに＠が含まれていなければ登録できないこと' do
      
    end
    it 'passwordが存在すれば登録できる' do
      
    end
    it 'passwordが空では登録できないこと' do
      
    end
    it 'passwordに半角英数字が存在すれば登録できる' do
      
    end
    it 'passwordが半角英語だけでは登録できないこと' do
      
    end
    it 'passwordが半角数字だけでは登録できないこと' do
      
    end
    it 'passwordが全角英語では登録できないこと' do
      
    end
    it 'passwordが全角数字では登録できないこと' do
      
    end
    it 'passwordが6文字以上であれば登録できること' do
      
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      
    end
    it 'passwordとpassword_confirmationが一致すれば登録できる' do
      
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      
    end
    it 'password_confirmationが存在すれば登録できる' do
      
    end
    it 'password_confirmationが空では登録できないこと' do
      
    end
    it 'password_confirmationに半角英数字が存在すれば登録できる' do
      
    end
    it 'password_confirmationが半角英語だけでは登録できないこと' do
      
    end
    it 'password_confirmationが半角数字だけでは登録できないこと' do
      
    end
    it 'password_confirmationが全角英語では登録できないこと' do
      
    end
    it 'password_confirmationが全角数字では登録できないこと' do
      
    end
    it 'password_confirmationが6文字以上であれば登録できること' do
      
    end
    it 'password_confirmationが5文字以下であれば登録できないこと' do
      
    end
    it 'last_nameが存在すれば登録できる' do
      
    end
    it 'last_nameが空では登録できないこと' do
      
    end
    it 'last_nameに漢字が存在すれば登録できる' do
      
    end
    it 'last_nameにひらがなが存在すれば登録できる' do
      
    end
    it 'last_nameにカタカナが存在すれば登録できる' do
      
    end
    it 'last_nameが半角英語では登録できないこと' do
      
    end
    it 'last_nameが半角数字では登録できないこと' do
      
    end
    it 'last_nameが全角数字では登録できないこと' do
      
    end
    it 'last_nameが全角英語では登録できないこと' do
      
    end
    it 'first_nameが存在すれば登録できる' do
      
    end
    it 'first_nameが空では登録できないこと' do
      
    end
    it 'first_nameに漢字が存在すれば登録できる' do
      
    end
    it 'first_nameにひらがなが存在すれば登録できる' do
      
    end
    it 'first_nameにカタカナが存在すれば登録できる' do
      
    end
    it 'first_nameが半角英語では登録できないこと' do
      
    end
    it 'first_nameが半角数字では登録できないこと' do
      
    end
    it 'first_nameが全角数字では登録できないこと' do
      
    end
    it 'first_nameが全角英語では登録できないこと' do
      
    end
    it 'last_name_kanaが空では登録できないこと' do
      
    end
    it 'last_name_kanaにカタカナが存在すれば登録できる' do
      
    end
    it 'last_name_kanaが半角英語では登録できないこと' do
      
    end
    it 'last_name_kanaが半角数字では登録できないこと' do
      
    end
    it 'last_name_kanaが全角英語では登録できないこと' do
      
    end
    it 'last_name_kanaが全角数字では登録できないこと' do
      
    end
    it 'last_name_kanaが漢字では登録できないこと' do
      
    end
    it 'first_name_kanaが空では登録できないこと' do
      
    end
    it 'first_name_kanaにカタカナが存在すれば登録できる' do
      
    end
    it 'first_name_kanaが半角英語では登録できないこと' do
      
    end
    it 'first_name_kanaが半角数字では登録できないこと' do
      
    end
    it 'first_name_kanaが全角英語では登録できないこと' do
      
    end
    it 'first_name_kanaが全角数字では登録できないこと' do
      
    end
    it 'first_name_kanaが漢字では登録できないこと' do
      
    end
    it 'dateの指定が無ければ登録できないこと' do
      
    end
    it 'dateの誕生月が選択されないと登録できないこと' do
      
    end
    it 'dateの誕生月が選択されないと登録できないこと' do
      
    end
    it 'dateの誕生日が選択されないと登録できないこと' do
      
    end
  end
end