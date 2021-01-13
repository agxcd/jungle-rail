require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(user).to be_valid
    end

    it 'should not save user if password confirmations does not match ' do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12333"
        )
      expect(user).to_not be_valid
    end

    it 'should not save user with same email' do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
      user2 = User.create(
        first_name: "Simplely",
        last_name: "Rickly",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(user2).to_not be_valid
    end

    it 'should not save without first name' do
      user = User.create(
        first_name: nil,
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
        expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should not save without last name' do
      user = User.create(
        first_name: "Simple",
        last_name: nil,
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
        expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should not save without email' do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: nil,
        password: "12345",
        password_confirmation: "12345"
        )
        expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should not save user if password is less than five characters' do
    user = User.create(
      first_name: "Simple",
      last_name: "Rick",
      email: "rick@123.com",
      password: "123",
      password_confirmation: "123"
        )
        expect(user.errors.full_messages).to include
      "Password is too short (minimum is 5 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login valid user' do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
        user1 = User.authenticate_with_credentials(user.email, user.password)
      expect(user1).to be true
    end

    it "should login in user with capital letters in email" do
    user = User.create(
      first_name: "Simple",
      last_name: "Rick",
      email: "rick@123.com",
      password: "12345",
      password_confirmation: "12345"
        )
        user1 = User.authenticate_with_credentials('RIck@123.com', user.password)
      expect(user1).to be true
    end

    it "should login in user with spaces in email" do
      user = User.create(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
          )
          user1 = User.authenticate_with_credentials("  rick@123.com ", user.password)
        expect(user1).to be true
      end
  end
end 
  
  