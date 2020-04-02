class AddTimestampToReviews < ActiveRecord::Migration[6.0]
  def change
      add_timestamps :reviews, null: true
      long_ago = DateTime.new(2020, 4, 2)
      Review.update_all(created_at: long_ago, updated_at: long_ago)
      change_column_null :reviews, :created_at, false
      change_column_null :reviews, :updated_at, false
    
  end
end
