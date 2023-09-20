class JobsController < ApplicationController
  before_action :set_job, only: %i[show update destroy]

  def index
    @jobs = Job.all
    render json: @jobs, each_serializer: JobSerializer
  end

  def show
    render json: @job, serializer: JobSerializer
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
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :job_type_id, :company_id, :description, :requirements, :expired_date,
                                :status, :location, :no_of_vacancies)
  end
end
