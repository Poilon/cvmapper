class CreateStudent < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :school
      t.integer :experience_level
    end
  end
end
