class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.integer :workable_item_id
      t.integer :posted_by

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
