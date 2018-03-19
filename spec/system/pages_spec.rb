require "rails_helper"

RSpec.describe "Pages#top", type: :system do
  before { visit "/" }

  it "displays app name" do
    within(".container") { expect(page).to have_text("ExpertTodo") }
  end

  it "displays app name on chrome-headless", js: true do
    within(".container") { expect(page).to have_text("ExpertTodo") }
  end
end
