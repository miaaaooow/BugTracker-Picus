class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.string :name, :null => false #this will be auto-generated based on the project name
      t.text :description
      t.integer :priority, :null => false, :default => 1
      t.integer :status_id, :null => false, :options => "REFERENCES statuses(id)"
      #creator
      t.integer :user_id, :null => false, :options => "REFERENCES users(id)"
      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
