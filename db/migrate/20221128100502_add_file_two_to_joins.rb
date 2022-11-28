class AddFileTwoToJoins < ActiveRecord::Migration[6.1]
  def change
    add_column :joins, :file_two, :string
  end
end
