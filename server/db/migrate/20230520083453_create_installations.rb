class CreateInstallations < ActiveRecord::Migration[6.1]
  def change
    create_table :installations do |t|
      t.references :address, null: false, foreign_key: true
      t.date :start_date
      t.integer :number_of_panels

      t.timestamps
    end
  end
end
