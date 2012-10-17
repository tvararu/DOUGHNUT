require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'DOUGHNUT'" do
      visit '/static_pages/home'
      page.should have_content('DOUGHNUT')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "DOUGHNUT | Home")
    end
  end
  
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "DOUGHNUT | Help")
    end
  end
  
  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "DOUGHNUT | About")
    end
  end
end