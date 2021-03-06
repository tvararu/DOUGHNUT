require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "index" do
    describe "as non-admin" do
      let (:user) { FactoryGirl.create(:user) }
      
      before do
        sign_in user
      end
      
      describe "should redirect to home" do
        before { visit users_path }
        specify { should have_selector('title', text: full_title('')) }
      end
    end
    
    describe "as admin" do
      let(:admin) { FactoryGirl.create(:admin) }
    
      before do
        sign_in admin
        visit users_path
      end
    
      describe "page" do
        it { should have_selector('title', text: 'All users') }
        it { should have_selector('h1', text: 'All users')}
      
        before(:all) { 30.times { FactoryGirl.create(:user) } }
        after(:all) { User.delete_all }
      
        describe "pagination" do

          it { should have_selector('div.pagination') }

          it "should list each user" do
            User.paginate(page: 1).each do |user|
              page.should have_selector('li', text: user.email)
            end
          end
        end
      
        describe "delete links" do
          it { should have_link('delete', href: user_path(User.first)) }
          it "should be able to delete another user" do
            expect { click_link('delete') }.to change(User, :count).by(-1)
          end
          it { should_not have_link('delete', href: user_path(admin)) }
        end
      end
    end
  end

  describe "signup" do
    before { visit signup_path }
    
    describe "page" do
      it { should have_selector('h1', text: 'Sign up') }
      it { should have_selector('title', text: full_title('Sign up')) }
    end
    
    let(:submit) { "Create my account" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector('title', text:'Sign up') }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
    end
  end

  describe "profile page" do
    let (:user) { FactoryGirl.create(:user) }
    let!(:t1) { FactoryGirl.create(:transaction, user: user, value: "1") }
    let!(:t2) { FactoryGirl.create(:transaction, user: user, value: "2") }
    
    describe "as own user" do
      before do
        sign_in user
        visit user_path(user)
      end
    
      describe "should show the profile page" do
        it { should have_selector('title', text: user.email) }
      end
      
      describe "should show transactions" do
        it { should have_content(t1.value) }
        it { should have_content(t2.value) }
      end
    end
    
    describe "as a different user" do
      let (:bill) { FactoryGirl.create(:user) }
      
      before { visit user_path(bill) }
      
      describe "should not show somebody else's profile page" do
        it { should_not have_selector('title', text: bill.email) }
      end
    end

    describe "as a guest" do
      before { visit user_path(user) }

      describe "should not show somebody's profile page" do
        it { should_not have_selector('title', text: user.email) }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
    
    describe "page" do
      it { should have_selector('h1', text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
    end
    
    describe "with invalid information" do
      before { click_button "Save changes" }
      
      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end
      
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.email.should == new_email }
    end
  end
end
