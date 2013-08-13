class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.belongs_to :list
      t.integer :position
      t.string :name

      t.timestamps
    end
  end
end
