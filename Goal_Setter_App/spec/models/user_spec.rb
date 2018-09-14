require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  
  it { should have_many(:goals) }
  
  describe "session_token" do 
    context "ensure_session_token" do 
      it "assigns session_token if one is not given" do 
        user = User.new(username: 'Billy', password: 'Billilly')
        expect(user.session_token).not_to be_nil
      end 
    end 
    context "reset_session_token!" do 
      it "resets to another session_token" do 
        user = User.new(username: 'Billy', password: 'Billilly')
        session_token1 = user.session_token 
        user.reset_session_token!
        expect(user.session_token).not_to eq(session_token1)
      end 
      it "saves user to database" do 
        user = User.new(username: 'Billy', password: 'Billilly')
        user.reset_session_token!
        expect(User.find_by(username: 'Billy')).not_to be_nil
      end 
    end 
  end 
  
  describe "password_encryption" do 
    it "doesn't save password to database" do 
      User.create(username: 'Billy', password: 'Billilly')
      user = User.find_by(username: 'Billy')
      expect(user.password).not_to be('Billilly')
    end 
    it "encrypts password with BCrypt"
  end 
  
  describe "user authentication" do 
    it "returns user if user_password matches"
    
    it "returns nil if user_password mismatches"
  end 
end
