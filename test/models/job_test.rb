require 'test_helper'

class JobTest < ActiveSupport::TestCase
  fixtures :jobs, :job_types

  def setup
    @job = jobs(:one)
  end

  test "should create a job" do
    assert @job.save
  end

  test "should belong to a job_type" do
    job_type = job_types(:one)

    @job.job_type = job_type
    assert @job.save
    assert_equal job_type, @job.job_type
  end

  test "should have many applications" do
    application1 = applications(:one)
    application2 = applications(:two)

    assert_includes @job.applications, application1
    assert_includes @job.applications, application2
  end

  test "should have a default status of 'pending'" do
    assert_equal 'pending', @job.status
  end

  test "should allow valid status values" do
    valid_statuses = ['pending', 'open', 'close']

    valid_statuses.each do |status|
      @job.status = status
      assert @job.valid?, "#{status} should be a valid status"
    end
  end
end
