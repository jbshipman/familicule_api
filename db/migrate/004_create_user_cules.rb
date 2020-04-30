class CreateUserCules < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cules do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :cule, index: true, foreign_key: true

      t.timestamps
    end
  end
end
