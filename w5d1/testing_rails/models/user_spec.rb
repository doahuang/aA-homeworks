require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: 'test', password: '123123') }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password_digest) }

  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    it 'returns true for correct password' do
      expect(user.is_password?('123123')).to be true
    end

    it 'returns false for incorrect password' do
      expect(user.is_password?('123456')).to be false
    end
  end

  describe '#reset_session_token!' do
    it 'resets old session token' do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end

    it 'returns a new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe '::find_by_credentials' do
    before(:each) do
      user.save
    end

    it 'returns the user with correct username and password' do
      expect(User.find_by_credentials('test', '123123')).to eq(user)
    end

    it 'returns nil otherwise' do
      expect(User.find_by_credentials('test', '123456')).to be_nil
    end
  end
  
end
