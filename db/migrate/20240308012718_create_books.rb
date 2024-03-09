class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :total_chapters, default: 1
      t.integer :current_chapter, default: 1
      t.timestamps
    end
  end
end
