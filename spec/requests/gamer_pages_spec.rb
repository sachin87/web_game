require 'spec_helper'

describe "Gamer pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "profile page" do
    let(:gamer) { FactoryGirl.create(:gamer) }
    before { visit gamer_path(gamer) }

    it { should have_selector('h1',    text: gamer.name) }
    it { should have_selector('title', text: gamer.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      
      it "should not create a gamer" do
        expect { click_button submit }.not_to change(Gamer, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
      
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Gamer"
        fill_in "Email",        with: "gamer@example.com"
        fill_in "Password",     with: "password"
        fill_in "Confirm Password", with: "password"
      end

      it "should create a gamer" do
        expect { click_button submit }.to change(Gamer, :count).by(1)
      end

      describe "after saving the gamer" do
        before { click_button submit }
        let(:gamer) { Gamer.find_by_email('gamer@example.com') }

        it { should have_selector('title', text: gamer.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end

      describe "followed by signout" do
        before do
          click_button submit
          click_link "Sign out"
        end
        it { should have_link('Sign in') }
      end

    end
  end

  describe "edit" do
    let(:gamer) { FactoryGirl.create(:gamer) }
    before do
      sign_in gamer
      visit edit_gamer_path(gamer)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit Gamer") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: gamer.password
        fill_in "Confirm Password", with: gamer.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { gamer.reload.name.should  == new_name }
      specify { gamer.reload.email.should == new_email }
    end

       describe "as wrong gamer" do
      let(:gamer) { FactoryGirl.create(:gamer) }
      let(:wrong_gamer) { FactoryGirl.create(:gamer, email: "wrong@example.com") }
      before { sign_in gamer }

      describe "visiting Users#edit page" do
        before { visit edit_gamer_path(wrong_gamer) }
        it { should_not have_selector('title', text: full_title('Edit gamer')) }
      end

      describe "submitting a PUT request to the Gamers#update action" do
        before { put gamer_path(wrong_gamer) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end

  end
  
