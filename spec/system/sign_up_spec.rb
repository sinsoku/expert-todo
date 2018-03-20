# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sign up", type: :system do
  it "sign up with email" do
    visit "/"

    click_on "Sign up"

    attrs = attributes_for(:user)

    within "#new_user" do
      fill_in "Email", with: attrs[:email]
      fill_in "Password", with: attrs[:password]
      fill_in "Password confirmation", with: attrs[:password]

      click_on "Sign up"
    end

    expect(page).to have_text I18n.t(:signed_up_but_unconfirmed, scope: %i[devise registrations])

    mail = Devise::Mailer.deliveries.first
    expect(mail.subject).to eq I18n.t(:subject, scope: %i[devise mailer confirmation_instructions])
  end

  context "when the user unconfirmed an email" do
    let(:user) { create :user }

    it "confirms an email" do
      visit user_confirmation_path(confirmation_token: user.confirmation_token)

      expect(page).to have_text I18n.t(:confirmed, scope: %i[devise confirmations])
    end
  end
end
