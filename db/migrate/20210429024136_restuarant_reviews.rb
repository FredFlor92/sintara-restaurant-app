class RestuarantReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_entries do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end

  end
end
