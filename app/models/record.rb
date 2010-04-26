# == Schema Information
# Schema version: 20100425094924
#
# Table name: records
#
#  id             :integer         not null, primary key
#  user_id        :integer         not null
#  bug_id         :integer         not null
#  change_type_id :integer         default(0), not null
#  comment        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Record < ActiveRecord::Base
  belongs_to :bug
  belongs_to :user
  belongs_to :change_type
end
