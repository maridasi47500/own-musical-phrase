class CreateFragments < ActiveRecord::Migration[8.0]
  def change
    create_table :fragments do |t|
      t.string :clef
      t.string :nuance
      t.string :key_signature
      t.string :time_signature
      t.string :caractere
      t.string :tempo
      t.string :title
      t.string :myscore

      t.timestamps
    end
  end
end
