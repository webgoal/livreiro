class Book < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :author, presence: true, length: {minimum: 3, maximum: 50}
  validates :publisher, presence: true, length: {minimum: 3, maximum: 50}
  validates :owner, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {minimum: 3, maximum: 100}
  validates :abstract,  length: {minimum: 10, maximum: 500}
end
