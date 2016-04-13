class CreateSkillStudent < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_students do |t|
      t.integer :student_id
      t.integer :skill_id
    end
  end
end
