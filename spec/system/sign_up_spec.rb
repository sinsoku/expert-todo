require "rails_helper"

RSpec.describe "Sign up", type: :system do
  it "sign up with email" do
    visit "/"

    click_link "Sign up"

    attrs = attributes_for(:user)
    fill_in "Email", with: attrs[:email]
    fill_in "Password", with: attrs[:password]
    fill_in "Password confirmation", with: attrs[:password]
    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
