# == Schema Information
#
# Table name: gamers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Gamer do
  before do
    @gamer = Gamer.new(name: "Demo Gamer", email: "gamer@example.com", 
                   password: "password", password_confirmation: "password")
  end

  subject { @gamer }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }


  it { should be_valid }

  describe "when name is not present" do
    before { @gamer.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @gamer.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not unique" do
    before { @new_gamer = Gamer.new(name: "new gamer", email: "gamer@example.com") }
    it { @new_gamer.should_not be_valid }
  end

  describe "when name is too long" do
    before { @gamer.name = "a" * 16 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      email_addresses = %w[gamer@foo,com gamer_at_foo.org example.gamer@foo.]
      email_addresses.each do |invalid_address|
        @gamer.email = invalid_address
        @gamer.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      email_addresses = %w[gamer@foo.com A_GAMER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      email_addresses.each do |valid_address|
        @gamer.email = valid_address
        @gamer.should be_valid
      end      
    end
  end

  describe "when password is not present" do
    before { @gamer.password = @gamer.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @gamer.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @gamer.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @gamer.password = @gamer.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

describe "return value of authenticate method" do
  before { @gamer.save }
  let(:current_gamer) { Gamer.find_by_email(@gamer.email) }

  describe "with valid password" do
    it { should == current_gamer.authenticate(@gamer.password) }
  end

  describe "with invalid password" do
    let(:gamer_with_invalid_password) { current_gamer.authenticate("invalid") }

    it { should_not == gamer_with_invalid_password }
    specify { gamer_with_invalid_password.should be_false }
  end
end

 describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @gamer.email = mixed_case_email
      @gamer.save
      @gamer.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "remember token" do
    before { @gamer.save }
    its(:remember_token) { should_not be_blank }
  end

end
