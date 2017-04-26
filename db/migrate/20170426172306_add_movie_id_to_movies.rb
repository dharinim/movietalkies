class AddMovieIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :the_movie_db_id, :integer
  end
end
