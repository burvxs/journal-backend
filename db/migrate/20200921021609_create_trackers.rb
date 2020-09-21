class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.integer :grand_total
      t.integer :weekly_total
      t.integer :daily_total
      t.integer :incomplete_total
      t.integer :incomplete_daily_total
      t.integer :incomplete_weekly_total

      t.timestamps
    end
  end
end
