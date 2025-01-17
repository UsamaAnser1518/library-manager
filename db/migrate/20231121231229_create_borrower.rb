class CreateBorrower < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :name, null: false
      t.string :card_title, null: false
      t.string :card_number, null: false
      t.string :card_csv, null: false

      t.timestamps
    end
  end
end
