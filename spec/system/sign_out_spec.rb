require "rails_helper"

RSpec.describe "Sign out", type: :system do
  include_context "logged_in"

  it "sign out" do
    visit "/"

    sign_out_icon = find('a:has(.fa-sign-out-alt)')
    sign_out_icon.click

    expect(page).to have_text("Signed out successfully.")
  end
end
