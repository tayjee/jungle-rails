require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before do
      @user1 = User.new(first_name: 'Jimmy', last_name: 'Tang', email: 'JimmyTang@gmail.com', password: 'password123', password_confirmation: 'password123')
    end

    it 'should be saved successfully with all required fields set' do
      @user1.save
      expect(@user1.errors.full_messages).to be_empty
    end

    it 'should return an error if password is empty' do
      @user2 = User.new(first_name: "Timmy", last_name: "Jang", email:"TimmyJang@gmail.com", password_confirmation: "password123")
      @user2.save
      expect(@user2.errors.full_messages).to include("Password can't be blank")
    end

    it 'should return an error if password is empty' do
      @user3 = User.new(first_name: "Limmy", last_name: "Lang", email:"LimmyLang@gmail.com", password: "password321", password_confirmation: "password123")
      @user3.save
      expect(@user3.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end
end
