class CreateFollowing < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.string :following_user_id, null: false
      t.string :follower_user_id, null: false
      t.timestamps null: false
    end
  end
end
