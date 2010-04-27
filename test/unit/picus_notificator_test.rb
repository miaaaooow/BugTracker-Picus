require 'test_helper'

class PicusNotificatorTest < ActionMailer::TestCase
  test "project_created" do
    @expected.subject = 'PicusNotificator#project_created'
    @expected.body    = read_fixture('project_created')
    @expected.date    = Time.now

    assert_equal @expected.encoded, PicusNotificator.create_project_created(@expected.date).encoded
  end

  test "version_created" do
    @expected.subject = 'PicusNotificator#version_created'
    @expected.body    = read_fixture('version_created')
    @expected.date    = Time.now

    assert_equal @expected.encoded, PicusNotificator.create_version_created(@expected.date).encoded
  end

  test "bug_created" do
    @expected.subject = 'PicusNotificator#bug_created'
    @expected.body    = read_fixture('bug_created')
    @expected.date    = Time.now

    assert_equal @expected.encoded, PicusNotificator.create_bug_created(@expected.date).encoded
  end

  test "bug_change" do
    @expected.subject = 'PicusNotificator#bug_change'
    @expected.body    = read_fixture('bug_change')
    @expected.date    = Time.now

    assert_equal @expected.encoded, PicusNotificator.create_bug_change(@expected.date).encoded
  end

end
