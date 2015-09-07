class RemoveColumnFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :payment_status, :string
  end
end
