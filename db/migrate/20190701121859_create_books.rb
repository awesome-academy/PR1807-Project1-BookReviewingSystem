class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image
      t.string :author
      t.integer :cate_id
      t.string :description

      t.timestamps
    end
  end
end
