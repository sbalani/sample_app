require 'spec_helper'

describe User do
  
	before { @user = User.new(name: "Exmaple User", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

describe "when name is not present" do
	before { @user.name = " "}
	it {should_not be_valid}
	end

	describe "when email is not present" do
	before { @user.email = " "}
	it {should_not be_valid}
	end

	describe "when name is too long" do
	before { @user.name = "a" * 51}
	it {should_not be_valid}
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
			addresses.each do [invalid address]
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end
end 
