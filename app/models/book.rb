class Book < ActiveRecord::Base
  validates :title, presence: true, length: { minimum:3  }
  validates :author, presence: true, length: { minimum:3  }
  validates :publisher, presence: true, length: { minimum:3  }
  validates :owner, presence: true, length: { minimum:3  }
  validates :email, presence: true, length: { minimum:3  }

  validates :lending_name, presence: true, length: { minimum:3  }
  validates :lending_email, presence: true, length: { minimum:3  }
  validates :lending_data, presence: true

  validates :abstract,  length: {minimum: 10}
  validates :question, presence: true, length: { minimum:3  }
  validates :answer, presence: true, length: { minimum:3  }
  validate  :validate_password, on: :update

  def validate_password
    if answer_was != answer
      errors.add(:answer, "Senha incorreta!")
    end
  end

  def self.search_by_owner(ownerName)
    Book.where(owner:ownerName)
  end

  def self.search_by_title(bookName)
    search_book = "%#{bookName}%"
    Book.where("title LIKE ?", search_book)
  end
end
