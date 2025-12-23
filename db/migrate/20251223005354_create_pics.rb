class CreatePics < ActiveRecord::Migration[8.0]
  def change
    create_table :pics do |t|
      t.integer :newscore_id
      t.string :mypic

      t.timestamps
    end
  end
end
