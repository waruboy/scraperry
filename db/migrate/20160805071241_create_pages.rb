class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :url
      t.text :status

      t.timestamps null: false
    end
  end
end
