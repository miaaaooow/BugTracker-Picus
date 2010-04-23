require 'test_helper'

class BugTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid priority number" do
    spider = Bug.new
    assert !spider.valid?

    spider = Bug.new (:name => "bug123", :description => "some issue", :priority => -1, :status => "OPEN")
    assert !spider.valid?
    assert_equal "Priority of change", bug.errors.on(:priority)
    spider = Bug.new (:name => "bug12", :description => "some issue", :priority => 0, :status => "REJECTED")
    assert !spider.valid?
    assert_equal "Priority of change", bug.errors.on(:priority)
    spider = Bug.new (:name => "bug134", :description => "some issue", :priority => 2.5, :status => "OPEN")
    assert !spider.valid?
    assert_equal "Priority of change", bug.errors.on(:priority)
    spider = Bug.new (:name => "bug125", :description => "some issue", :priority => 6, :status => "OPEN")
    assert !spider.valid?
    assert_equal "Priority of change", bug.errors.on(:priority)

    spider = Bug.new (:name => "bug12", :description => "some issue", :priority => 5, :status => "OPEN")
    assert spider.valid?
    spider = Bug.new (:name => "bug12", :description => "some issue", :priority => 1, :status => "WORKS HERE")
    assert spider.valid?
  end

  test "valid status string" do
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "OPEN")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "REJECTED")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "NEW")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "REOPEN")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "WORKS HERE")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "DISASTER")
    assert ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "CLOSED")
    assert ladybird.valid?
     
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "closed")
    assert !ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "buzzword")
    assert !ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => "New")
    assert !ladybird.valid?
    ladybird = Bug.new (:name => "some", :description => "some issue", :priority => 3, :status => 1)
    assert !ladybird.valid?

  end
end
