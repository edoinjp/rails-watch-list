class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :movie, null: false
      t.references :list, null: false

      t.timestamps
    end

    add_foreign_key :bookmarks, :movies, column: :movie_id

    if table_exists?(:lists)
      add_foreign_key :bookmarks, :lists, column: :list_id
    end

    add_index :bookmarks, [:movie_id, :list_id], unique: true
  end
end
