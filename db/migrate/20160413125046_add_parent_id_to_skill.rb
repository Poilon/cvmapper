class AddParentIdToSkill < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :parent_id, :integer
  end
end
