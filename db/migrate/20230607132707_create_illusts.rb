class CreateIllusts < ActiveRecord::Migration[6.1]
  def change
    create_table :illusts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
