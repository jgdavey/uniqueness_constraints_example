class AddUniquenessValidationOnListItems < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table list_items
        add constraint list_item_position unique (list_id, position);
    SQL
  end

  def down
    execute <<-SQL
      alter table list_items
        drop constraint if exists list_item_position;
    SQL
  end
end
