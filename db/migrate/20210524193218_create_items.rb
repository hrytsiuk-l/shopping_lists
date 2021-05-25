class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :uid
      t.integer :price
      t.string :name
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :items, :list_id
  end
end
