class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.integer :user_id, :null => false, :options => "REFERENCES users(id)"
      t.integer :bug_id,  :null => false, :options => "REFERENCES bugs(id)"
      t.integer :change_type_id, :null => false, :options => "REFERENCES statuses(id)", :default => 0 #new
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
