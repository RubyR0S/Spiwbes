class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.datetime :notify_at

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
