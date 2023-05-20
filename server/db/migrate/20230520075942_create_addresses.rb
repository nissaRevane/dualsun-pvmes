class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
