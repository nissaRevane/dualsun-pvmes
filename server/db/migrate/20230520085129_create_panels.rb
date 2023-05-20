class CreatePanels < ActiveRecord::Migration[6.1]
  def change
    create_table :panels do |t|
      t.references :installation, null: false, foreign_key: true
      t.string :type
      t.string :serial_number

      t.timestamps
    end
  end
end
