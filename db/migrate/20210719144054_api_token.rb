class ApiToken < ActiveRecord::Migration[5.0]
  def change
    create_table :api_token do |t|
      t.references :users, foreign_key: true
      t.string :token, null: false
      t.timestamps null: false
    end
  end
end
