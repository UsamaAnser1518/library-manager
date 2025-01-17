class AddCopiesToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :copies, :integer, default: 1
  end
end
