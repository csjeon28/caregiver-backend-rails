class ParentFavoritesController < ApplicationController
    before_action :set_parent, only: [:create]

    def create
        if @parent
            @parent_favorite = ParentFavorite.find_by(caregiver_id: parent_favorite_params[:caregiver_id], parent_id: @parent.id)
            if @parent_favorite
                deletedId = @parent_favorite.id
                if @parent_favorite.destroy
                    render json: { created: false, removedId: deletedId }
                end
            else
                @parent_favorite = ParentFavorite.new(parent_favorite_params)
                @parent_favorite.parent_id = @parent.id
                if @parent_favorite.save
                    render json: {created: true, favorite: @parent_favorite.as_json }
                end
            end
        end
    end

    private

    def parent_favorite_params
        params.require(:parent_favorite).permit(:parent_id, :caregiver_id)
    end
end
