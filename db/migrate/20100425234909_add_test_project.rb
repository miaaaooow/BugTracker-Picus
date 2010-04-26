class AddTestProject < ActiveRecord::Migration
  def self.up 
    project = Project.new(:name => "Kliment",
                          :description => "Stamina in Bulgarian",
                          :user_id => '1')
    project.save
  end

  def self.down
#    Project.destroy(['name = ?', "Kliment"])
  end
end
