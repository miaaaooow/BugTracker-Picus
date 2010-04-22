class BugsUsers < ActiveRecord::Migration
  '''The following table contains user_ids of the people 
    who will receive an e-mail on a bug change 
    of the corresponding bug'''

  def self.up
    create_table :bugs_users, :id => false do |t|
      t.integer :bug_id, :null => false, :options => "REFERENCES bug(id)"
      t.integer :user_id, :null => false, :options => "REFERENCES user(id)"
      t.timestamps
    end
  end

  def self.down
    drop_table :bugs_users
  end
end
