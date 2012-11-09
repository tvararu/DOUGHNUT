require 'spec_helper'

describe "Pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'DOUGHNUT' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: '| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all static pages"
  end

  it "should have the right links in the layout" do
    visit root_path
    click_link "Sign up now"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "DOUGHNUT"
    page.should have_selector 'title', text: full_title('')
  end
  
  describe "layout links as admin:" do
    let(:admin) { FactoryGirl.create(:admin) }
    
    before do
      sign_in admin
      visit root_path
    end
    
    it "users link" do
      click_link "Users"
      page.should have_selector 'title', text: full_title('All users')
    end
  end
end