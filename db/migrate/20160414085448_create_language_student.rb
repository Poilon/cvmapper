class CreateLanguageStudent < ActiveRecord::Migration[5.0]
  def change
    create_table :language_students do |t|
      t.integer :student_id
      t.integer :language_id
    end
  end
end
