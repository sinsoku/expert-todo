# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true

  has_one :task_completion, dependent: :destroy
  has_many_attached :files

  def complete
    TaskCompletion.create_or_find_by!(task_id: id)
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def completed_at
    task_completion&.created_at
  end

  def completed?
    !completed_at.nil?
  end
end
