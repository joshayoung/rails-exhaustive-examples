class AddRegistrarsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :registrars do |t|
      t.references :klass, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
