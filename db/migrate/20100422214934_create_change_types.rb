class CreateChangeTypes < ActiveRecord::Migration
  def self.up
    create_table :change_types do |t|
      t.string :type
    
      t.timestamps
    end

    ChangeType.create(:type => "creation")
    ChangeType.create(:type => "comment")
    ChangeType.create(:type => "edit info")
    ChangeType.create(:type => "change status") 
    ChangeType.create(:type => "change priority")
  end

  def self.down
    drop_table :change_types
  end
end
