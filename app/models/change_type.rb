class ChangeType < ActiveRecord::Base
  has_many :records
  validates_presence_of :type
end
