class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :description
      t.string :date
      t.string :time
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
