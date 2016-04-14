class CreateLanguage < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :parent_id
    end
  end
end
