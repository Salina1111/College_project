class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :table do |t|
      t.integer :Roll_No
      t.string :Name
      t.string :Faculty
      t.integer :Year
      t.integer :Contact_Number
      t.integer :Donation_quantity
      t.timestamps


    end
  end
end
