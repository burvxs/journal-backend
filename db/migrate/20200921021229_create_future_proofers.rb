class CreateFutureProofers < ActiveRecord::Migration[5.2]
  def change
    create_table :future_proofers do |t|
      t.integer :user_id
      t.integer :time_frame

      t.timestamps
    end
  end
end
