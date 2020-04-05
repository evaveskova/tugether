require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Hugo', email: 'hugo@mail.com', password: '123456') }

  describe '#name' do
    it 'should be present' do
      user.name = ''
  		user.valid?
  		expect(user.errors[:name]).to include('can\'t be blank')
    end

    it 'should have at least 2 characters' do
      user.name = 'a'
      user.valid?
      expect(user.errors[:name]).to include('is too short (minimum is 2 characters)')
    end

    it 'shouldn\'t have more than 50 characters' do
      user.name = 'a' * 51
      user.valid?
      expect(user.errors[:name]).to include('is too long (maximum is 50 characters)')
    end
  end

  describe '#email' do
    it 'should be present' do
      user.email = ''
      user.valid?
  		expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'should be of valid format' do
      user.email = 'invalid'
      user.valid?
  		expect(user.errors[:email]).to include('is invalid')
    end

    it 'should be unique' do
      User.create(name: 'Hugo', email: 'hugo@mail.com', password: '123456')
      user = User.create(name: 'Another Hugo', email: 'hugo@mail.com', password: '123456')
      user.valid?
  		expect(user.errors[:email]).to include('has already been taken')
    end
  end

  describe '#password' do
    it 'should be present' do
      user = User.create(name: 'Hugo', email: 'hugo@mail.com', password: '')
      user.valid?
  		expect(user.errors[:password]).to include('can\'t be blank')
    end

    it 'should have at least 6 characters' do
      user.password = 'a' * 5
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end
end
