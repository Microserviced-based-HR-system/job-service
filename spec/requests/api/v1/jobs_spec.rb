require 'swagger_helper'

# rubocop:disable Metrics/BlockLength, Layout/LineLength
RSpec.describe 'api/v1/jobs', type: :request do
  path '/api/v1/jobs' do
    get('list jobs') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                pagy: {
                  total_pages: 1,
                  page: 1,
                  count: 1,
                  per_page: 10
                },
                jobs: [
                  {
                    id: 123,
                    title: "Software Engineer",
                    job_type_id: 1,
                    company_id: 1,
                    description: "We are looking for a talented Software Engineer to join our team. The ideal candidate will have experience in Ruby on Rails and JavaScript.",
                    requirements: "Bachelor's degree in Computer Science or a related field. 3+ years of experience in Ruby on Rails and JavaScript. Experience with AWS and Azure is a plus.",
                    expired_date: "2023-11-30",
                    status: "Published",
                    location: "Singapore",
                    no_of_vacancies: 1
                  }
                ]
              }
            }
          }
        end
        run_test!
      end
    end

    post('create job') do
      response(201, 'successful') do
        parameter name: :job, in: :body, schema: {
          type: :object,
          properties: {
            job: {
              type: :object,
              properties: {
                job_type_id: { type: :string, example: FactoryBot.create(:job_type).id },
                company_id: { type: :string },
                title: { type: :string },
                description: { type: :string },
                requirements: { type: :string },
                expired_date: { type: :string },
                status: { type: :integer },
                location: { type: :string },
                no_of_vacancies: { type: :string },
              },
              required: %w[company_id],
            },
          },
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                id: 124,
                job_type_id: 2,
                company_id: 2,
                title: "Data Scientist",
                description: "We are looking for a skilled Data Scientist to join our team. The ideal candidate will have experience in Python and machine learning.",
                requirements: "Master's degree in Data Science or a related field. 3+ years of experience in Python and machine learning. Experience with Spark and Hadoop is a plus.",
                expired_date: "2023-12-31",
                status: "Published",
                location: "London",
                no_of_vacancies: 1
              }
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/jobs/{id}' do
    parameter name: :id, in: :path, type: :string

    get('show job') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                id: 123,
                title: "Software Engineer",
                job_type_id: 1,
                company_id: 1,
                description: "We are looking for a talented Software Engineer to join our team. The ideal candidate will have experience in Ruby on Rails and JavaScript.",
                requirements: "Bachelor's degree in Computer Science or a related field. 3+ years of experience in Ruby on Rails and JavaScript. Experience with AWS and Azure is a plus.",
                expired_date: "2023-11-30",
                status: "Open",
                location: "Singapore",
                no_of_vacancies: 1
              }
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/jobs/{id}' do
    patch('update job') do
      response(200, 'successful') do
        parameter name: :id, in: :path, type: :string

        parameter name: :job, in: :body, schema: {
          type: :object,
          properties: {
            job: {
              type: :object,
              properties: {
                job_type_id: { type: :string, default: FactoryBot.create(:job_type).id },
                company_id: { type: :string },
                title: { type: :string },
                description: { type: :string },
                requirements: { type: :string },
                expired_date: { type: :string },
                status: { type: :integer },
                location: { type: :string },
                no_of_vacancies: { type: :string },
              },
              required: %w[company_id],
            },
          },
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                id: 123,
                title: "Senior Software Engineer",
                job_type_id: 1,
                company_id: 1,
                description: "We are looking for a talented Senior Software Engineer to join our team. The ideal candidate will have experience in Ruby on Rails and JavaScript, as well as experience with AWS and Azure.",
                requirements: "Bachelor's degree in Computer Science or a related field. 5+ years of experience in Ruby on Rails and JavaScript. Experience with AWS and Azure is a plus.",
                expired_date: "2023-12-31",
                status: "Published",
                location: "Singapore",
                no_of_vacancies: 1
              }
            }
          }
        end
        run_test!
      end
    end

    put('update job') do
      response(200, 'successful') do
        parameter name: :id, in: :path, type: :string

        parameter name: :job, in: :body, schema: {
          type: :object,
          properties: {
            job: {
              type: :object,
              properties: {
                job_type_id: { type: :string, default: FactoryBot.create(:job_type).id },
                company_id: { type: :string },
                title: { type: :string },
                description: { type: :string },
                requirements: { type: :string },
                expired_date: { type: :string },
                status: { type: :integer },
                location: { type: :string },
                no_of_vacancies: { type: :string },
              },
              required: %w[company_id],
            },
          },
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                id: 123,
                title: "Senior Software Engineer",
                job_type_id: 1,
                company_id: 1,
                description: "We are looking for a talented Senior Software Engineer to join our team. The ideal candidate will have experience in Ruby on Rails and JavaScript, as well as experience with AWS and Azure.",
                requirements: "Bachelor's degree in Computer Science or a related field. 5+ years of experience in Ruby on Rails and JavaScript. Experience with AWS and Azure is a plus.",
                expired_date: "2023-12-31",
                status: "Published",
                location: "Singapore",
                no_of_vacancies: 1
              }
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/jobs/{id}' do
    parameter name: :id, in: :path, type: :string

    delete('delete job') do
      response(204, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: {
                message: 'Job successfully deleted'
              }
            }
          }
        end
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Layout/LineLength
