class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :server_ip
      t.string :server_type

      t.timestamps
    end
  end
end
