require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do
      it "saves product to database" do
        category = Category.create(name: "Girls")
        product = Product.create(name: "dress", price: 50, quantity: 2, category: category)
        expect(product).to be_present
      end

      it "does not saves if product has not name" do
        category = Category.create(name: "Girls")
        product = Product.create(name: nil, price: 50, quantity: 2, category: category)
        expect(product.errors.full_messages).to include "Name can't be blank"
    end

      it "does not saves if product has not price" do
        category = Category.create(name: "Girls")
        product = Product.create(name: "dress", price: nil, quantity: 2, category: category)
        expect(product.errors.full_messages).to include "Price cents is not a number"
      end


      it "does not saves if product has not quantity" do
        category = Category.create(name: "Girls")
        product = Product.create(name: "dress", price: 50, quantity: nil, category: category)
        expect(product.errors.full_messages).to include "Quantity can't be blank"
      end

      it "does not saves if product has not name" do
        category = Category.create(name: "Girls")
        product = Product.create(name: "dress", price: 50, quantity: 2, category: nil)
        expect(product.errors.full_messages).to include "Category can't be blank"
      end
    end
  end