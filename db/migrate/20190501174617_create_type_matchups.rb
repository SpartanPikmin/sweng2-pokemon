class CreateTypeMatchups < ActiveRecord::Migration[5.2]
  def change
    create_table :type_matchups do |t|
      t.string :source
      t.string :target
      t.integer :efficacy      
    end
  end
end
