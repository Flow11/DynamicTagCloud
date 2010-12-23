class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :id_tag
      t.integer :occurrence
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end