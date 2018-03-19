class Task < ApplicationRecord
  validates :title, presence: true

  has_one :task_completion

  def completed_at
    task_completion&.created_at
  end

  def completed?
    !completed_at.nil?
  end
end
