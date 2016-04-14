class CreateCompanyStudent < ActiveRecord::Migration[5.0]
  def change
    create_table :company_students do |t|
      t.integer :student_id
      t.integer :company_id
    end
  end
end
