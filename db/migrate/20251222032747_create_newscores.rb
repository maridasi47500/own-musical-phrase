class CreateNewscores < ActiveRecord::Migration[8.0]
  def change
    create_table :newscores do |t|
      t.string :title
      t.string :composer
      t.string :toplevelmarkup
      t.string :metronomemark
      t.string :textmark
      t.string :cmajorsevensymbol
      t.string :testscript
      t.string :fingering
      t.string :notehead
      t.string :rest
      t.string :tuplenumber
      t.string :lyrictext
      t.string :dynamictext
      t.string :key_signature
      t.string :time_signature

      t.timestamps
    end
  end
end
