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
  validates :answer, presence: true, length: { minimum:3  }, on: :create
  validate  :validate_password, on: :update

  def validate_password
    if answer_was != answer
      errors.add(:answer, "Senha incorreta!")
    end
  end

  def self.search_by_owner(ownerName)
    search_owner = "%#{ownerName}%"
    Book.where("owner LIKE ?", search_owner)
  end

  def self.search_by_title(bookName)
    search_title = "%#{bookName}%"
    Book.where("title LIKE ?", search_title)
  end

  def self.search_by_email(paramEmail)
    search_email = "%#{paramEmail}%"
    Book.where("email LIKE ?", search_email)
  end
end
