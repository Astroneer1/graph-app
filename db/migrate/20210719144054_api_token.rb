class ApiToken < ActiveRecord::Migration[5.0]
  def change
    create_table :api_tokens do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false
      t.timestamps null: false
    end
  end
end
