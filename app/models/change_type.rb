# == Schema Information
# Schema version: 20100425094924
#
# Table name: change_types
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ChangeType < ActiveRecord::Base
  has_many :records
  validates_presence_of :type
end
