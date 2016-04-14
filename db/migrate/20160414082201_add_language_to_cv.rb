class AddLanguageToCv < ActiveRecord::Migration[5.0]
  def change
    add_column :cvs, :language, :string
  end
end
