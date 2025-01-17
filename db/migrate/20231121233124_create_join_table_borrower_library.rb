class CreateJoinTableBorrowerLibrary < ActiveRecord::Migration[7.0]
  def change
    create_table :library_borrowers do |t|
      t.references :library, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
