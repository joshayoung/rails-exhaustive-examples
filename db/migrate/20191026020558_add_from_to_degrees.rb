class AddFromToDegrees < ActiveRecord::Migration[5.2]
  def change
    add_column :degrees, :from, :string
  end
end
