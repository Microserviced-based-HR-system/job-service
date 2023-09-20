require 'test_helper'

class JobTypeTest < ActiveSupport::TestCase
  fixtures :job_types, :jobs

  test "has many jobs" do
    job_type = job_types(:one)
    job_1 = jobs(:one)
    job_2 = jobs(:two)

    # Assert that the job_type has many jobs
    assert_equal 2, job_type.jobs.count

    # Assert that the job_type includes the two jobs
    assert_includes job_type.jobs, job_1
    assert_includes job_type.jobs, job_2
  end
end
