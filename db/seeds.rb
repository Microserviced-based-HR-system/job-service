# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "factory_bot_rails"

puts "Creating seeds..."

job_types = ["Permanent", "Contract", "Remote", "Temporary", "Part-time", "Internship", "Seasonal", "Freelance"]

job_types.each do |type|
  JobType.find_or_create_by(name: type)
end
puts "JobTypes created"

job_type = FactoryBot.create(:job_type)
puts "JobType created"

job = FactoryBot.create(:job, job_type: JobType.first)
job.open!
puts "Job created"

application = FactoryBot.create(:application, job: job)
application.submitted!
puts "Application created"
