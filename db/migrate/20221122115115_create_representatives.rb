class CreateRepresentatives < ActiveRecord::Migration[6.1]
  def change
    create_table :representatives do |t|
      t.string :titre
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
