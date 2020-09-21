class RenameSublistIdToSubListId < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :sublist_id, :sub_list_id
  end
end
