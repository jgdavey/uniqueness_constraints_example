class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.belongs_to :list, null: false
      t.integer :position, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
