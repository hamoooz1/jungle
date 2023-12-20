require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
    it 'should save successfully with all attributes' do
      category = Category.create(name: 'Shrubs')
      product = Product.new(
        name: 'plant',
        price_cents: 9999,
        quantity: 5,
        category: category
      )
      expect(product).to be_valid
      product.save!
    end

    it 'should validate presence of name' do
      category = Category.create(name: 'Shrubs')
      product = Product.new(
        name: nil,
        price_cents: 9999,
        quantity: 5,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate presence of price' do
      category = Category.create(name: 'Shrubs')
      product = Product.new(
        name: 'plant',
        price_cents: nil,
        quantity: 5,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate presence of quantity' do
      category = Category.create(name: 'Shrubs')
      product = Product.new(
        name: 'plant',
        price_cents: 9999,
        quantity: nil,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    # Example 5: Test validation for presence of category
    it 'should validate presence of category' do
      product = Product.new(
        name: 'plant',
        price_cents: 9999,
        quantity: 5,
        category: nil
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
