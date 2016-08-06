class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
