# frozen_string_literal: true

require "rails_helper"

RSpec.describe "TaskCompletion", type: :system do
  include_context "logged_in"

  context "when the user has a uncomplete task" do
    let!(:task) { create :task, user: current_user }

    it "complets a task" do
      visit "/"

      within("#task_#{task.id}") { click_on "Complete" }

      expect(page).to have_text("Task was successfully completed.")

      completed_at = I18n.l(task.completed_at, format: :long)
      expect(page).to have_text(completed_at)
    end
  end
end
