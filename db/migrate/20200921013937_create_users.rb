class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.text :email
      t.text :name
      t.text :password
      t.boolean :prioritising
      t.boolean :daily_review

      t.timestamps
    end
  end
end
