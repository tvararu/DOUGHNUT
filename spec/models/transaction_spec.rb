require 'spec_helper'

describe Transaction do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @transaction = user.transactions.build(value: "133.7", description: "Foobar", date: Time.now)
  end
  
  subject { @transaction }
  
  describe "attributes" do
    it { should respond_to(:value) }
    it { should respond_to(:description) }
    it { should respond_to(:date) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should == user }
    
    it { should be_valid }
  end
  
  describe "user_id" do
    describe "not present" do
      before { @transaction.user_id = nil }
      it { should_not be_valid }
    end
    
    it "should not be accessible" do
      expect do
        Transaction.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "date" do
    describe "not present" do
      before { @transaction.date = nil }
      it { should_not be_valid }
    end
  end
  
  describe "description" do
    describe "is too long" do
      before { @transaction.description = 'a' * 256 }
      it { should_not be_valid }
    end
  end
end
