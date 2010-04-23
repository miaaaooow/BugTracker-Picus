class Bug < ActiveRecord::Base
  belongs_to :version
  belongs_to :status
  has_one :user
  has_and_belongs_to_many :users
  has_many :records

  validates_presence_of :name, :description, :priority, :status
  validates_uniqueness_of :name
  validate :priority_is_in_range
  validate :status_is_viable

  #change this.
  def priority_in_range
    errors.add("Priority out of range") if not[1, 2, 3, 4, 5].include? :priority
  end

  def status_is_viable
    #test_if_status is from db
  end
end
