class CreateOsResources < ActiveRecord::Migration[5.0]
  def change
    create_table :os_resources do |t|
      t.timestamps :get_resource_timestamps
      t.integer :r
      t.integer :b
      t.integer :swpd
      t.integer :free
      t.integer :buff
      t.integer :cache
      t.integer :si
      t.integer :so
      t.integer :bi
      t.integer :bo
      t.integer :in
      t.integer :cs
      t.integer :us
      t.integer :sy
      t.integer :idle
      t.integer :wa
      t.integer :st
      t.references :server, foreign_key: true

      t.timestamps
    end
  end
end
