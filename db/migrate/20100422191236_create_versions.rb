class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|      
      t.string :name, :null => false
      t.integer :user_id, :options => "REFERENCES users(id)"
      t.integer :project_id, :options => "REFERENCES projects(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
