class Creategame < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :list_id
      t.integer :user_id
    end
  end
end
