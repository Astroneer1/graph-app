class CreatePost < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :message, null: false
      t.timestamps null: false
    end
  end
end
