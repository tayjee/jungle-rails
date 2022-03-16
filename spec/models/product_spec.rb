require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before do 
      @category = Category.new(id: 1, name: 'Apparel')
      @category.save
    end

    it 'should save sucessfully with all fields set' do
      @product = Product.new(name: "T-Shirt", price_cents: 10000, quantity: 10, category_id: 1)
      @product.save
      expect(@product.id).to be_present
    end

    it 'should return an error if name does not exist' do
      @product = Product.new(price_cents: 10000, quantity: 10, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should return an error if price does not exist' do
      @product = Product.new(name: "T-Shirt", quantity: 10, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    
    it 'should return an error if quantity does not exist' do
      @product = Product.new(name: "T-Shirt", price_cents: 10000, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should return an error if category does not exist' do
      @product = Product.new(name: "T-Shirt", price_cents: 10000, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end