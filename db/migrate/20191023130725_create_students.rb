class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :average_grade
      t.date :class_of

      t.timestamps
    end
  end
end
