class ChangeType < ActiveRecord::Base
  belongs_to :record
  validates_presence_of :type
end
