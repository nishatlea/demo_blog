class Article < ApplicationRecord
  validates :title, presence: true , length: { minimum: 4 }
  validates :body, presence: true, length: { minimum: 10 }
  has_many :comments

end
