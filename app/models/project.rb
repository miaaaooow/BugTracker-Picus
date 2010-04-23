class Project < ActiveRecord::Base
  has_many :versions
  belongs_to :user
  
  validates_presence_of :name #, :first_version_name
  validates_uniqueness_of: :name
end
