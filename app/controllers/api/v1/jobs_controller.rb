class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show update destroy]
  include Pagy::Backend

  def index
    # Rails.logger.info("bazbar, request-id: #{request.request_id}")
    @pagy, @jobs = pagy(Job.order(created_at: :desc), items: params[:per_page])
    render_success("Job List", serialized_jobs, pagy_metadata(@pagy))
  end

  def show
    render_success("Job Details", serialized_job(@job))
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, serializer: JobSerializer
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job, serializer: JobSerializer
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    head :no_content
  end

  private

  def set_job
    begin
      @job = Job.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_error("Job not found", :not_found)
    end
  end

  def serialized_job(job)
    JobSerializer.new(job).serializable_hash[:data][:attributes]
  end

  def serialized_jobs
    @jobs.map { |job| serialized_job(job) }
  end

  def job_params
    params.require(:job).permit(:title, :job_type_id, :company_id, :description, :requirements, :expired_date,
                                :status, :location, :no_of_vacancies)
  end

  def render_success(msg, tdata, pagy = nil)
    response_data = {
      code: 200,
      message: msg,
      data: tdata,
    }
    response_data[:pagy] = pagy if pagy
    render json: response_data
  end

  def render_error(error_message, sts = :unprocessable_entity)
    render json: { error: error_message }, status: sts
  end
end
