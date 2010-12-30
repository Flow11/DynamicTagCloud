class CreateEquivalences < ActiveRecord::Migration
  def self.up
    create_table :equivalences do |t|
      t.string :tag1
      t.string :tag2

      t.timestamps
    end
  end

  def self.down
    drop_table :equivalences
  end
end
