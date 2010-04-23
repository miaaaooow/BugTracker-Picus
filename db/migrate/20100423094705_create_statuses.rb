class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end

    Status.create(:name => "NEW")
    Status.create(:name => "OPEN")
    Status.create(:name => "REJECTED")
    Status.create(:name => "WORKS HERE")
    Status.create(:name => "DISASTER")
    Status.create(:name => "FIXED")
    Status.create(:name => "REOPEN")    
  end

  def self.down
    drop_table :statuses
  end
end





