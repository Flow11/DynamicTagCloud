class CreateArticlesTags < ActiveRecord::Migration
  def self.up
    create_table :articles_tags, {:id => false, :force => true} do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles_tags
  end
end
