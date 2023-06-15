class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review, null: false
      t.integer :rating, null: false, default: 1
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
