class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :description
      t.string :value, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
