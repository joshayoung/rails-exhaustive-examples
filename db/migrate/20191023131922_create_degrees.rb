class CreateDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :degrees do |t|
      t.string :title
      t.numeric :level
      t.date :completed

      t.timestamps
    end
  end
end
