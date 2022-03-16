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
  end
end
