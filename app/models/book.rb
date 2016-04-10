class Book < ActiveRecord::Base
  validates :title, presence: true, length: { minimum:3  }
  validates :author, presence: true, length: { minimum:3  }
  validates :publisher, presence: true, length: { minimum:3  }
  validates :owner, presence: true, length: { minimum:3  }
  validates :email, presence: true, length: { minimum:3  }

  validate :validate_lending_name
  validate :validate_lending_email
  validate :validate_lending_data

  validates :abstract,  length: {minimum: 10}
  validates :question, presence: true, length: { minimum:3  }
  validates :answer, presence: true, length: { minimum:3  }, on: :create
  validate  :validate_password, on: :update
  has_many :commentaries

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

  def validate_lending_name
    if  lending_name.blank? && !(lending_email.blank? || lending_data.blank?)
      errors.add(:lending_name, "Preencha o campo de nome!")
    end
  end

  def validate_lending_email
    if  lending_email.blank? && !(lending_name.blank? || lending_data.blank?)
        errors.add(:lending_email, "Preencha o campo de email!")
    end
  end

  def validate_lending_data
    if  lending_data.blank? && !(lending_name.blank? || lending_email.blank?)
        errors.add(:lending_data, "Preencha o campo de data!")
    end
  end

end
