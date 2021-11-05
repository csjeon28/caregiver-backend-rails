class JobsController < ApplicationController
  before_action :authorized, only: [:auto_login, :destroy]
  skip_before_action :authorized, only: [:create, :all_jobs]
  before_action :set_job, only: [:destroy]
  before_action :set_parent, only: [:create, :index]

  # GET /all-jobs
  def all_jobs
    @jobs = Job.all
    render json: @jobs
  end

  # GET /:id/jobs
  def index
    if params[:parent_id].present?
      set_parent
      @jobs = @parent.jobs
    end
  
    render json: @jobs
  end
  
  # POST /jobs
  def create
    @job = @parent.jobs.new(job_params)
    @job.parent_id = @parent.id
    if @job.valid?
    @job.save
      render json: @job, status: :created
    else
      render json: {error: @job.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  # DELETE /jobs/1
  def destroy
    @job.destroy
  end
  
  private
  
  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
  
  def job_params
      params.require(:job).permit(:title, :job_description, :number_of_children, 
      :hourly_rate, :required_to_drive, :specific_days_needed, :parent_id)
  end
end