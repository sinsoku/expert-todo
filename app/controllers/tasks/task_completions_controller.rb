# frozen_string_literal: true

module Tasks
  class TaskCompletionsController < ApplicationController
    # POST /tasks/:task_id/completion
    def create
      task = current_user.tasks.find(params[:task_id])

      if task.complete
        flash.notice = "Task was successfully completed."
      else
        flash.alert = "Something went wrong"
      end

      redirect_to tasks_path
    end
  end
end
