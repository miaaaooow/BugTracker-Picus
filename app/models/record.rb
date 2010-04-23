class Record < ActiveRecord::Base
  belongs_to :bug
  belongs_to :user
  belongs_to :change_type
end
