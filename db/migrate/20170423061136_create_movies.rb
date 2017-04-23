class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :poster_path
      t.boolean :adult
      t.string :overview
      t.date :release_date
      # t.string :genre_ids
      t.integer :id_original
      t.string :original_title
      t.string :original_language
      t.string :backdrop_path
      t.integer :popularity
      t.integer :vote_count
      t.string :video
      t.integer :vote_average
      t.timestamps
    end
  end
end
   