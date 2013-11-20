require 'spec_helper'

describe "Activities" do
  describe "GET /activities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      user = User.create!(first_name: "Normal",
                         last_name: "User",
                         email: "super@whoiscoco.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: false)
      u = mock("User")
      u.should_receive(:id).and_return(1234)
      #get user_activities_path(u.id)
      #response.status.should be(200)
    end
  end
end