class CreateSubLists < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_lists do |t|
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end
end
