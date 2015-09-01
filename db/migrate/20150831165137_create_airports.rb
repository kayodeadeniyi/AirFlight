class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
