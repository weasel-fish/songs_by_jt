class SongsController < ApplicationController

    def index
        songs = Song.all
        render json: songs, except: [:created_at, :updated_at]
    end

    def show
        song = Song.find(params[:id])
        if song
            render json: song, serializer: SongNestedReviewsSerializer
        else
            render json: {error: "Song not found"}, status: :not_found
        end
    end
end
