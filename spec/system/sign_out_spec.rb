require "rails_helper"

RSpec.describe "Sign out", type: :system do
  include_context "logged_in"

  before { driven_by(:rack_test) }

  it "sign out" do
    visit "/"

    click_link "Sign out"

    expect(page).to have_text("Signed out successfully.")
  end
end
