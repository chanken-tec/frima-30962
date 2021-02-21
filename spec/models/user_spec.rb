require 'rails_helper'
RSpec.describe User, type: :model do
  describe "会員新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email、password,password_confirmation,first_name,last_name,first_name_ruby,last_name_ruby,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが必須であること' do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスは、＠を含む必要があること' do
      expect(@user.email).to include('@')
    end

    it 'パスワードが必須であること' do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、６文字以上での入力が必須であること' do
      @user.password = "000aa"
      @user.password_confirmation = "000aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = "ＡＡＡＡＡＡ"
      @user.password_confirmation = "ＡＡＡＡＡＡ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end

    it 'パスワードは、確認用を含めて２回入力すること' do
      @user.password = "000aaa"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード(確認用)、値の一致が必須であること' do
      @user.password = "000000"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.first_name = ""
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
    end

    it 'ユーザー本名は、全角(漢字・ひらがな・カタカナ)での入力が必須であること' do
      @user.first_name = "Mihon"
      @user.last_name = "Taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end

    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
      @user.first_name_ruby = ""
      @user.last_name_ruby = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank", "First name ruby is invalid", "Last name ruby can't be blank", "Last name ruby is invalid")
    end

    it 'ユーザー本名のフリガナは、全角(カタカナ)での入力が必須であること' do
      @user.first_name_ruby = "ﾐﾎﾝ"
      @user.last_name_ruby = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby is invalid", "Last name ruby is invalid")
    end

    it '生年月日が必須であること' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end