# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sign in", type: :system do
  let!(:user) { create :user, :confirmed }

  it "sign in" do
    visit "/"

    click_on "Sign in"

    within "#new_user" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on "Log in"
    end

    expect(page).to have_text("Signed in successfully.")
  end
end
