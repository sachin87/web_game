require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    before { visit home_path }

    it "should have the content 'Sample App'" do
      page.should have_content('Battleship')
    end

    it "should have the title 'Home'" do
      page.should have_selector('title', :text => "Battle Ship | Home")
    end

  end

  describe "Contact page" do

    before { visit contact_path }

    it "should have the content 'Contact'" do
      page.should have_content('Contact')
    end

    it "should have the title 'Contact'" do
      page.should have_selector('title',
        :text => "Battle Ship | Contact")
    end

  end

  describe "Help page" do

    before { visit help_path }

    it "should have the content 'Help'" do
      page.should have_content('HELP')
    end

    it "should have the title 'Help'" do
      page.should have_selector('title', :text => "Battle Ship | Help")
    end

  end

  describe "About US page" do

    before { visit about_path }

    it "should have the content 'About Us'" do
      page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
      page.should have_selector('title', :text => "Battle Ship | About Us")
    end

  end

end