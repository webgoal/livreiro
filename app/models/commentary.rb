class Commentary < ActiveRecord::Base
  validates :name, presence: true, length: { minimum:3  }
  validates :commentary, presence: true, length: { minimum:3  }
  belongs_to :book
end
