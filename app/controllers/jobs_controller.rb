class JobsController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy]
    before_action :set_job, only: [:show, :update, :destroy]
    # before_action :set_caregiver, only: [:create]
  
    # GET /jobs
    def index
      if params[:caregiver_id].present?
        @caregiver = Caregiver.find(params[:caregiver_id])
        @jobs = @caregiver.jobs.caregiver_jobs(@caregiver.id)
      end
  
      if params[:parent_id].present?
        @parent = Parent.find(params[:parent_id])
        @jobs = @parent.jobs.parent_jobs(@parent.id)
      end
  
      render json: @jobs
    end
  
    # GET /jobs/1
    def show
      render json: @job
    end
  
    # POST /jobs
    def create
      @job = @parent.jobs.new(job_params)
    #   //not sure if i need this code below
      @job.parent_id = @parent.id  
      @job.save
        render json: @job, status: :created
    #   else
    #     render json: @job.errors, status: :unprocessable_entity
    #   end
    end
  
    # PATCH/PUT /jobs/1
    def update
      if @job.update(job_params)
        render json: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /jobs/1
    def destroy
      @job.destroy
    end
  
    private
  
    def set_job
      @job = Job.find(params[:id])
    end
  
    # def set_caregiver
    #   @caregiver = Caregiver.find(params[:caregiver_id])
    # end
  
    def job_params
        params.require(:job).permit(:title, :city, :state, :job_description, :number_of_children, 
        :hourly_rate, :required_to_drive, :specific_days_needed, :caregiver_id, :parent_id)
    end

end