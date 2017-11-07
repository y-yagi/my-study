class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.string :title, null: false
      t.string :content
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
