class CreateJoinTableBookBorrower < ActiveRecord::Migration[7.0]
  def change
    create_table :borrower_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
