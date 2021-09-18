class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :attendee_id
    end
  end
end
