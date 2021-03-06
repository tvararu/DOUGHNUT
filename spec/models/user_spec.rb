require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "user@example.com", 
                            password: "foobar", password_confirmation: "foobar")
  end
  
  subject { @user }
  
  describe "attributes" do
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:admin) }
    it { should respond_to(:authenticate) }
    it { should respond_to(:transactions) }

    it { should be_valid }
    it { should_not be_admin }
  end
  
  describe "admin" do
    it "should not be accessible" do
      expect do
        User.new(admin: true)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    
    describe "set to 'true'" do
      before do
        @user.save!
        @user.toggle!(:admin)
      end

      it { should be_admin }
    end
  end
  
  describe "email" do
    describe "not present" do
      before { @user.email = " " }
      it { should_not be_valid }
    end
    
    describe "format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          @user.should_not be_valid
        end
      end
    end
    
    describe "format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          @user.should be_valid
        end
      end
    end
    
    describe "is taken" do
      before do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        duplicate_user.save
      end

      it { should_not be_valid }
    end
    
    describe "is mixed case" do
      let(:mixed_case_email) { "Foo@ExAMPle.com" }

      it "should be saved as all lower-case" do
        @user.email = mixed_case_email
        @user.save
        @user.reload.email.should == mixed_case_email.downcase
      end
    end
  end
  
  describe "password" do
    describe "not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
    end

    describe "too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
    
    describe "doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
    
    describe "confirmation is nil" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
    end
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
    
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:user_with_invalid_password) { found_user.authenticate("invalid") }
      
      it { should_not == user_with_invalid_password }
      specify { user_with_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "transactions" do
    before { @user.save }
    let!(:transaction) do
      FactoryGirl.create(:transaction, user: @user, created_at: Time.now)
    end
    let!(:older_transaction) do
      FactoryGirl.create(:transaction, user: @user, created_at: 1.day.ago)
    end
    
    it "should be in the right order" do
      @user.transactions.should == [transaction, older_transaction]
    end
    
    it "should be destroyed along with user" do
      transactions = @user.transactions.dup
      @user.destroy
      transactions.should_not be_empty
      transactions.each do |transaction|
        Transaction.find_by_id(transaction.id).should be_nil
      end
    end
  end
end
