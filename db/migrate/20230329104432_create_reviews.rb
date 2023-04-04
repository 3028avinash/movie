class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :rate
      

      t.timestamps
    end
  end
end
