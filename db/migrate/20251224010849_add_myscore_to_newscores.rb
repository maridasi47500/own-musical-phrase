class AddMyscoreToNewscores < ActiveRecord::Migration[8.0]
  def change
    add_column :newscores, :myscore, :string
  end
end
