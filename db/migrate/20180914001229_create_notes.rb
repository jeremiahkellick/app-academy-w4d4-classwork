class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.references :track, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
