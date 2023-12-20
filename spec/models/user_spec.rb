require 'rails_helper'

  RSpec.describe User, type: :model do
    describe 'Validations' do
      # validation tests/examples here
      it 'should save successfully with all attributes' do
        user = User.new(
          first_name: 'hamza',
          last_name: "kad",
          email: "test@test.com",
          password: "hamzass",
          password_confirmation: "hamzass"
        )
        expect(user).to be_valid
        user.save!
      end
  
      it 'should have a matching password and password_confirmation' do
        user = User.new(
          first_name: 'hamza',
          last_name: 'kad',
          email: 'test@test.com',
          password: 'hamza',
          password_confirmation: 'wrongpassword'
        )
        expect(user).not_to be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it 'should require a password' do
        user = User.new(
          first_name: 'hamza',
          last_name: 'kad',
          email: 'test@test.com'
        )
        expect(user).not_to be_valid
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
  
      describe 'Password minimum length' do
        it 'should enforce a minimum password length' do
          user = User.new(
            first_name: 'hamza',
            last_name: 'kad',
            email: 'test@test.com',
            password: 'short',
            password_confirmation: 'short'
          )
          expect(user).not_to be_valid
          expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
      end
    end
  
    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it 'should authenticate with valid credentials' do
        user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'john@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        authenticated_user = User.authenticate_with_credentials('john@example.com', 'password')
        expect(authenticated_user).to eq(user)
      end
    end
  end
