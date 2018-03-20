class Task < ApplicationRecord
  validates :title, presence: true

  has_one :task_completion

  def complete
    TaskCompletion.create_or_find_by!(task_id: id)
    true
  rescue
    false
  end

  def completed_at
    task_completion&.created_at
  end

  def completed?
    !completed_at.nil?
  end
end
