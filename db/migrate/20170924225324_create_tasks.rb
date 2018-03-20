# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :note, null: false, default: ""
      t.datetime :expired_at

      t.timestamps
    end
  end
end
