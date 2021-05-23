class AddReminderToList < ActiveRecord::Migration[6.1]
  def change
    add_reference :reminders, :list, null: false, foreign_key: true
  end
end
