class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :user_id

      t.timestamps
    end
  end
end
