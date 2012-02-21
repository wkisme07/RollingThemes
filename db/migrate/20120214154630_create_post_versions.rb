class CreatePostVersions < ActiveRecord::Migration
  def change
    create_table :post_versions do |t|
      t.integer :post_id
      t.integer :author_id
      t.integer :version
      t.string  :title
      t.text    :content

      t.timestamps
    end
  end
end
