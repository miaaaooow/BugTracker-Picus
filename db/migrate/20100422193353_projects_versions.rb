class ProjectsVersions < ActiveRecord::Migration
  def self.up
    create_table :projects_versions, :id => false do |t|
      t.integer :project_id, :null => false, :options => "REFERENCES projects(id)"
      t.integer :version_id, :null => false, :options => "REFERENCES versions(id)"
    end
  end

  def self.down
    drop_table :projects_versions
  end
end
