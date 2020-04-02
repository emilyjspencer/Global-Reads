class Review < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 4, maximum: 40 }
    validates :review, presence: true, length: { minimum: 20, maximum: 800 }
end