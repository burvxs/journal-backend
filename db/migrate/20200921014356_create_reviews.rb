class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review_id
      t.integer :user_id
      t.text :weekly_review
      t.text :daily_review
      t.text :future_proof_review
      t.integer :future_proofer_id

      t.timestamps
    end
  end
end
