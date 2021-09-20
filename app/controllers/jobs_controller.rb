class JobsController < ApplicationController
    before_action :authorize_parent, only: [:create, :update, :destroy]
    before_action :find_job, only: [:update, :destroy]

    def create
        if current_parent
            job = Job.new(job_params)
            job.parent_id = current_parent.id
            job.save
                if job.persisted?
                    render json: job, status: :created
                else
                    render json: {errors: 'Failed to create job'}, status: :not_acceptable
                end
        else
            render json: {errors: job.errors.full_messages}, status: :not_acceptable
        end
    end

    def update
        if job.update(job_params)
            render json: job, status: :ok
        else
            render json: {errors: job.errors.full_messages}, status: :bad_request
        end
    end

    def destroy 
        # @job = Job.find_by(id: params[:id])
        if job.destroy
            render json: {errors: 'Job was deleted'}
        else
            render json: {errors: 'Delete failed'}
        end
    end

    private

    def job_params
        params.require(:job).permit(:title, :city, :state, :job_description, :number_of_children, 
        :hourly_rate, :required_to_drive, :specific_days_needed, :caregiver_id, :parent_id)
    end

    def find_job
        job = Job.find_by(id: params[:id])
        if !job
            render json: {errors: job.errors.full_messages}, status: :bad_request
        else
            return job
        end
    end
end
