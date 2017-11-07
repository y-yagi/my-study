class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.string :content
      t.integer :hour, default: 0
      t.integer :minute, default: 0
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :theme, foreign_key: true, null: false

      t.timestamps
    end
  end
end
