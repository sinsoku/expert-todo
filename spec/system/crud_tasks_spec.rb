require "rails_helper"

RSpec.describe "Tasks", type: :system do
  include_context "logged_in"

  it "new task" do
    visit "/"

    click_link "New Task"

    within "#new_task" do
      fill_in "Title", with: "title"

      click_button "Create Task"
    end

    expect(page).to have_text("Task was successfully created.")
  end

  context do
    let!(:task) { create :task }

    it "edit task" do
      visit tasks_path

      within("#task_#{task.id}") { click_link "Edit" }

      within "#edit_task_#{task.id}" do
        fill_in "Title", with: "title"

        click_button "Update Task"
      end

      expect(page).to have_text("Task was successfully updated.")
    end

    it "destroy task" do
      visit tasks_path

      within("#task_#{task.id}") { click_link "Destroy" }

      expect(page).to have_text("Task was successfully destroyed.")
    end
  end
end
