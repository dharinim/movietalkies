class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :comment
      t.date :review_date
      t.references :movie
      t.references :user
      t.timestamps
    end
  end
end
