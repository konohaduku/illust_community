class CreateIllustComments < ActiveRecord::Migration[6.1]
  def change
    create_table :illust_comments do |t|

      t.timestamps
    end
  end
end
