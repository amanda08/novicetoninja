require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
  	user = create(:user)
  	visit signin_path
  	click_link "password"
  	fill_in "email", with: user.email
  	click_button "Reset Password"
  	current_path.should eq(root_path)
  	page.should have_content("Email sent")
  end
end
