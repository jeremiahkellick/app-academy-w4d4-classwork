require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:george) do
    User.create(email: 'george@george.com', password: 'starwars')
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    context 'when given the correct password' do
      it 'returns true' do
        expect(george.is_password?('starwars')).to be(true)
      end
    end

    context 'when given an incorrect password' do
      it 'returns false' do
        expect(george.is_password?('not_georges_password')).to be(false)
      end
    end
  end

  describe '#reset_session_token' do
    it 'changes the session_token' do
      expect { george.reset_session_token! }.to change { george.session_token }
    end

    it 'returns the new session_token' do
      expect(george.reset_session_token!).to eq(george.session_token)
    end
  end

  describe '::find_by_credentials' do
    context "when given a user's credentials" do
      it 'returns that user' do
        expect(
          User.find_by_credentials(george.email, george.password).id
        ).to eq(george.id)
      end
    end

    context "when given an email that doesn't exist" do
      it 'returns nil' do
        expect(User.find_by_credentials("nope@email.com", 'foobar')).to be(nil)
      end
    end

    context 'when given an incorrect password' do
      it 'returns nil' do
        expect(User.find_by_credentials(george.email, 'dfahjklh')).to be(nil)
      end
    end
  end
end
