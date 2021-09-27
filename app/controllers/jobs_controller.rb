# class JobsController < ApplicationController
    # before_action :authorize_parent, only: [:index, :create, :update, :destroy]
    # # before_action :find_job, only: [:update, :destroy]

    # def index
    #     job = Job.all 
    #     render json: job
    # end

    # def create
    #     if current_parent
    #         job = Job.new(job_params)
    #         job.parent_id = current_parent.id
    #         job.save
    #             # if job.persisted?
    #             render json: job, status: :created
    #             # else
    #             #     render json: {errors: 'Failed to create job'}, status: :not_acceptable
    #             # end
    #     else
    #         render json: {errors: job.errors.full_messages}, status: :not_acceptable
    #     end
    # end

    # def update
    #     if job.update(job_params)
    #         render json: job, status: :ok
    #     else
    #         render json: {errors: job.errors.full_messages}, status: :bad_request
    #     end
    # end

    # def destroy 
    #     # @job = Job.find_by(id: params[:id])
    #     if job.destroy
    #         render json: {errors: 'Job was deleted'}
    #     else
    #         render json: {errors: 'Delete failed'}
    #     end
    # end

    # private

    # def job_params
    #     params.require(:job).permit(:title, :city, :state, :job_description, :number_of_children, 
    #     :hourly_rate, :required_to_drive, :specific_days_needed, :caregiver_id, :parent_id)
    # end

    # def find_job
    #     job = Job.find_by(id: params[:id])
    #     if !job
    #         render json: {errors: job.errors.full_messages}, status: :bad_request
    #     else
    #         return job
    #     end
    # end
# end



class JobsController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy]
    before_action :set_job, only: [:show, :update, :destroy]
    before_action :set_caregiver, only: [:create]
  
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
      @job = @caregiver.jobs.new(job_params)
  
      if @job.save
        render json: @job, status: :created
      else
        render json: @job.errors, status: :unprocessable_entity
      end
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
  
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
  
    def set_caregiver
      @caregiver = Caregiver.find(params[:caregiver_id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def job_params
        params.require(:job).permit(:title, :city, :state, :job_description, :number_of_children, 
        :hourly_rate, :required_to_drive, :specific_days_needed, :caregiver_id, :parent_id)
    end

end