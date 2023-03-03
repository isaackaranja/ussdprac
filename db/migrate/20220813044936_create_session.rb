class CreateSession < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :next
      t.string :previous
      t.string :sessionId
      t.text   :responses

      t.timestamps
    end
  end
end
