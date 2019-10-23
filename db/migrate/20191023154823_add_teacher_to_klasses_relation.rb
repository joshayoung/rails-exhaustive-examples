class AddTeacherToKlassesRelation < ActiveRecord::Migration[5.2]
  def change
    add_reference(:klasses, :teacher, foreign_key: true)
  end
end
