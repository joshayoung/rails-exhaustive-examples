class AddForeignKeyToDegree < ActiveRecord::Migration[5.2]
  def change
    add_reference(:degrees, :teacher, foreign_key: true)
  end
end
