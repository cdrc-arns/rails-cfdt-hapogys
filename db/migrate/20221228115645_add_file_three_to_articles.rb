class AddFileThreeToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :file_three, :string
  end
end
