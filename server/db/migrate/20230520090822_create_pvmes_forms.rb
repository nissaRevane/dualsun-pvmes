class CreatePvmesForms < ActiveRecord::Migration[6.1]
  def change
    create_table :pvmes_forms do |t|
      t.references :company, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :installation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
