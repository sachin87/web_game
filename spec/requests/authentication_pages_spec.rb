require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do

    before { visit signin_path }

    describe "with valid information" do
      let(:gamer) { FactoryGirl.create(:gamer) }
      before { sign_in gamer }

      it { should have_selector('title', text: gamer.name) }
      it { should have_link('Profile',  href: gamer_path(gamer)) }
      it { should have_link('Settings', href: edit_gamer_path(gamer)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end

   describe "authorization" do

    describe "for non-signed-in gamers" do
      let(:gamer) { FactoryGirl.create(:gamer) }

      describe "in the gamers controller" do

        describe "visiting the edit page" do
          before { visit edit_gamer_path(gamer) }
          it { should have_selector('title', text: 'Sign in') }
        end

        describe "submitting to the update action" do
          before { put gamer_path(gamer) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
  end

end
