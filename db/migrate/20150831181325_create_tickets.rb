class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :booking_id
      t.string :passenger_id

      t.timestamps null: false
    end
  end
end
