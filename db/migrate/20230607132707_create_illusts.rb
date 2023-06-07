class CreateIllusts < ActiveRecord::Migration[6.1]
  def change
    create_table :illusts do |t|

      t.timestamps
    end
  end
end
