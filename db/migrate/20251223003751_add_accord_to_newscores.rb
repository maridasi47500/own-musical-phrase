class AddAccordToNewscores < ActiveRecord::Migration[8.0]
  def change
    add_column :newscores, :accord, :string
  end
end
