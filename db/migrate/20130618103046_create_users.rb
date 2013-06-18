class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :apple_token
      t.string :android_token

      t.timestamps
    end
  end
end
