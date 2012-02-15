class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.boolean :published, :default => false
      t.integer :version
      t.string  :title
      t.text    :content

      t.timestamps
    end
  end
end
