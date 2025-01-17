class AddDueDateToBorrowerBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :borrower_books, :due_date, :datetime, null: false
  end
end
