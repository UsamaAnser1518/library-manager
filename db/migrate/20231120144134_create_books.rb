class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :isbn, null: false
      t.string :author, null: false
      t.bigint :library_id, index: true

      t.timestamps
    end
  end
end
