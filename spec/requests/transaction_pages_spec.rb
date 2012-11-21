require 'spec_helper'

describe "TransactionPages" do
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  # describe "transaction creation" do
end
