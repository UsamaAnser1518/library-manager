class AddAvalibiltyToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :is_available, :boolean, default: true
  end
end
