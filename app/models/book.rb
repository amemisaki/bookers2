class Book < ApplicationRecord
    validates :title,presence: true
    validates :body,presence: true
    validates_length_of :body, maximum: 200
    belongs_to :user
end
