require "rails_helper"

RSpec.describe "Sign in", type: :system do
  let!(:user) { create :user }

  it "sign in" do
    visit "/"

    click_link "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_text("Signed in successfully.")
  end
end
