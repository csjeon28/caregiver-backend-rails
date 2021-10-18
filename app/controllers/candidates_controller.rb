class CandidatesController < ApplicationController
    before_action :authorized, only: [:create]
    before_action :set_caregiver

    def create
        @candidate = Candidate.find_by(job_id: candidate_params[:job_id], caregiver_id: @caregiver.id)
        if @candidate
            @candidate = Candidate.new(candidate_params)
            @candidate.caregiver_id = @caregiver.id
                if @candidate.save
                    render json: {job_id: candidate_params[:job_id] }, status: :created
                end
            end
    end

    private

    def candidate_params
        params.require(:candidate).permit(:job_id, :caregiver_id)
    end

end
