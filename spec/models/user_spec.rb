require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = "test.test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'TEST１２'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = "test11"
        @user.password_confirmation = "text11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナ以外は登録できない(半角文字)' do
        @user.last_name_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'last_name_kanaが全角カタカナ以外は登録できない(全角文字)' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaは全角カタカナ以外は登録できない(半角文字)' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'first_name_kanaは全角カタカナ以外は登録できない(全角文字)' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context '新規登録できる時' do
      it 'name, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で英数が混合の時登録できる' do
        @user.password = "test11"
        @user.password_confirmation = "test11"
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'タナカ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end
  end
end