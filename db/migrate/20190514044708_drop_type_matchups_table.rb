class DropTypeMatchupsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :type_matchups
  end
end
