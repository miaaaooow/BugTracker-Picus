class Version < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :bugs

  validates_presence_of :name
end
