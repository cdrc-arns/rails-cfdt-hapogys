class CreateUploadFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :upload_files do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
