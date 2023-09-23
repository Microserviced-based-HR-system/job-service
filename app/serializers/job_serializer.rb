class JobSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :job_type, :company_id, :description, :requirements, :expired_date,
             :status, :location, :no_of_vacancies

  attributes :job_type do |obj|
    obj.job_type.name
  end
end
