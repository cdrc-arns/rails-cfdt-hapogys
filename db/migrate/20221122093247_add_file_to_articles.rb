class AddFileToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :file, :string
  end
end
