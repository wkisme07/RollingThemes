class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.text   :profile
      t.string :avatar

      t.timestamps
    end
  end
end
