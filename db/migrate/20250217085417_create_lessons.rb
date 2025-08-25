class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.string :prefecture
      t.integer :price
      t.integer :capacity
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
