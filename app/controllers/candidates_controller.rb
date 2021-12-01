class CandidatesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]
    before_action :set_caregiver, only: [:create, :index]

    def create
        set_caregiver
        if @caregiver
            # @candidate = Candidate.find_by(job_id: candidate_params[:job_id], caregiver_id: @caregiver.id)
            # if @candidate
                @candidate = Candidate.new(candidate_params)
                @candidate.caregiver_id = @caregiver.id
                # @job_title = Job.find_by(params[:job_id]).title
                if @candidate.valid?
                   @candidate.save
                    render json: {job_id: candidate_params[:job_id] }, status: :ok
                else 
                    render json: { error: 'Caregiver already requested this job' }
                end
            # end
        end
    end

    def index
        set_caregiver
        if @caregiver
            # @candidates = @caregiver.candidates.as_json(:include => :job, :only => [:job_id, :caregiver_id])
            @candidates = @caregiver.candidates.as_json(:include => [:job, :caregiver], :only => [:job_id, :caregiver_id])
            render json: @candidates
        end
    end
    
    private

    def set_caregiver
        @caregiver = Caregiver.find(params[:caregiver_id])
    end

    def candidate_params
        params.require(:candidate).permit(:job_id, :caregiver_id)
    end

end
