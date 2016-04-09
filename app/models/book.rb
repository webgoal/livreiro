class Book < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :author, presence: true, length: {minimum: 3, maximum: 50}
  validates :publisher, presence: true, length: {minimum: 3, maximum: 50}
  validates :owner, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, length: {minimum: 3, maximum: 100}

  validates :lending_name, presence: true,  length: {minimum: 5, maximum: 50}
  validates :lending_email, presence: true,  length: {minimum: 3, maximum: 50}
  validates :lending_data, presence: true

  validates :abstract,  length: {minimum: 10, maximum: 500}
  validates :question, presence: true, length: {minimum: 10, maximum: 100}
  validates :answer, presence: true, length: {minimum: 6, maximum: 10}
  validate  :validate_password, on: :update

  def validate_password
    if answer_was != answer
      errors.add(:answer, "Senha incorreta!")
    end
  end
end
