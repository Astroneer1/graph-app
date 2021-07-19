class CreateFollowing < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :following_user, foreign_key: { to_table: :users }, index: true, null: false
      t.timestamps null: false
    end
  end
end
