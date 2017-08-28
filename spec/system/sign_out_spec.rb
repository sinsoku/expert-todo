require "rails_helper"

RSpec.describe "Sign out", type: :system do
  let(:user) { create :user }
  before do
    driven_by(:rack_test)
    login_as user
  end

  it "sign out" do
    visit "/"

    click_link "Sign out"

    expect(page).to have_text("Signed out successfully.")
  end
end
