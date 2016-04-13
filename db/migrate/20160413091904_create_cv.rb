class CreateCv < ActiveRecord::Migration[5.0]
  def change
    create_table :cvs do |t|
      t.datetime :uploaded_at
      t.integer :student_id
      t.text :content
    end
  end
end
