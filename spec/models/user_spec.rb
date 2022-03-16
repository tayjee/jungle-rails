require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before do
      @user1 = User.new(first_name: "Jimmy", last_name: "Tang", email: "JimmyTang@gmail.com", password: "password123", password_confirmation: "password123")
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

    it 'should return an error if password does not match confirmation' do
      @user3 = User.new(first_name: "Limmy", last_name: "Lang", email:"LimmyLang@gmail.com", password: "password321", password_confirmation: "password123")
      @user3.save
      expect(@user3.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should return an error if password does not meet minimum length' do
      @user4 = User.new(first_name: "Zimmy", last_name: "Zang", email:"ZimmyZang@gmail.com", password: "12345", password_confirmation: "password123")
      @user4.save
      expect(@user4.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it 'should be successful if credentials are correct' do
        expect(@user1.authenticate_with_credentials("JimmyTang@gmail.com", "password123"))
      end

      it 'should be successful if credentials are correct but email contains extra white space' do
        expect(@user1.authenticate_with_credentials("   JimmyTang@gmail.com   ", "password123"))
      end

      it 'should be successful if credentials are correct but email contains different capitalization' do
        expect(@user1.authenticate_with_credentials("JiMmYTaNg@gmail.com", "password123"))
      end

      it 'should be NIL if email is incorrect' do
        expect(@user1.authenticate_with_credentials("WrongEmail@gmail.com", "password123"))
      end

      it 'should be NIL if password is incorrect' do
        expect(@user1.authenticate_with_credentials("JimmyTang@gmail.com", "incorrectpassword123"))
      end

    end

  end
end
