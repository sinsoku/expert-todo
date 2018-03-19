module Tasks
  class TaskCompletionsController < ApplicationController
    # POST /tasks/:task_id/completion
    def create
      task = Task.find(params[:task_id])
      complete_task(task)

      redirect_to tasks_path
    end

    private

    def complete_task(task)
      TaskCompletion.create_or_find_by!(task_id: task.id)
      flash.notice = "Task was successfully completed."
    rescue
      flash.alert = "Something went wrong"
    end
  end
end
