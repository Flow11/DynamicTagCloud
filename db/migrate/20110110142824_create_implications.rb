class CreateImplications < ActiveRecord::Migration
  def self.up
    create_table :implications do |t|
      t.string :tag_1
      t.string :tag_2

      t.timestamps
    end
  end

  def self.down
    drop_table :implications
  end
end
