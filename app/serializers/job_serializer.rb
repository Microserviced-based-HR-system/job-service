class JobSerializer
  include JSONAPI::Serializer
  attributes :title, :job_type, :company_id, :description, :requirements, :expired_date,
             :status, :location, :no_of_vacancies

  def job_type
    object.job_type.name
  end
end
