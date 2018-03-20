# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  describe "#complete" do
    let(:task) { create :task }

    context "when the task is incomplete" do
      it "completes a task" do
        expect(task.complete).to be true
        expect(TaskCompletion).to be_exist(task_id: task.id)
      end
    end

    context "when the task has already completed" do
      let!(:task_completion) { create :task_completion, task: task }

      it "returns true, but does not create a new record" do
        expect(task.complete).to be true
        expect(TaskCompletion.where(task_id: task.id)).to contain_exactly task_completion
      end
    end

    context "when something went wrong" do
      let(:task) { build :task }

      it { expect(task.complete).to be false }
    end
  end
end
