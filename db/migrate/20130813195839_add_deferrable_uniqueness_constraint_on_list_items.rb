class AddDeferrableUniquenessConstraintOnListItems < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table list_items
        drop constraint if exists list_item_position;
      alter table list_items
        add constraint list_item_position unique (list_id, position)
        deferrable initially immediate;
    SQL
  end

  def down
    execute <<-SQL
      alter table list_items
        drop constraint if exists list_item_position;
      alter table list_items
        add constraint list_item_position unique (list_id, position);
    SQL
  end
end
