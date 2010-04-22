class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :name
      t.string :email, :null => false
      t.string :encrypted_password, :null => false
      t.string :salt
      t.boolean :admin, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
