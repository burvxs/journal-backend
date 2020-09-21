class AddColumnsToFutureproofersStartDateEndDate < ActiveRecord::Migration[5.2]
  def change
    add_column :future_proofers, :start_date, :datetime
    add_column :future_proofers, :end_date, :datetime
  end
end
