class AddCoordinatesToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :latitude, :float
    add_column :lessons, :longitude, :float
  end
end
