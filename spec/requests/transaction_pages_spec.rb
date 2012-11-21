require 'spec_helper'

describe "TransactionPages" do
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "transaction creation" do
    before { visit user_path(user) }
    
    describe "with invalid information" do
      it "should not create a transaction" do
        expect { click_button "Add" }.not_to change(Transaction, :count)
      end
      
      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      before do
        fill_in 'transaction_value', with: "1337"
        fill_in 'transaction_description', with: "Lorem ipsum"
      end
      
      it "should create a transaction" do
        expect { click_button "Add" }.to change(Transaction, :count).by(1)
      end
    end
  end
end
