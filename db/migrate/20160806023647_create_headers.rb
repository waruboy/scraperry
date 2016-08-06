class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.text :tag
      t.text :content
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
