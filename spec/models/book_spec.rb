require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validate_password" do
    it "should match password in the DB" do
      book = create :book, answer: "teste123"
      book.answer = 'teste1234'
      expect(book.valid?).to be false
    end
  end

  describe "search_by_owner" do
    it "should find a book by owner" do
      create :book, owner: "bruno"
      create :book, owner: "eder"
      create :book, owner: "teste"
      create :book, owner: "bruno"
      expect(Book.search_by_owner("bruno").length).to eq 2

    end
  end

  describe "search_by_title" do
    it "should find a book by title" do
      create :book, title: "Harry Potter"
      create :book, title: "Livro das Zueiras"
      create :book, title: "Game of Thrones"
      create :book, title: "Harry Potter"
      create :book, title: "O Harry Potter"
      create :book, title: "JHarry Potter"
      create :book, title: "Meu nome é Potter, Harry"
      create :book, title: "Pokemon"
      expect(Book.search_by_title("Harry").length).to eq 5

    end
  end

  describe "search_by_email" do
    it "should find a book by email" do
      create :book, email: "bruno@bruno.com.br"
      create :book, email: "eder@eder.com"
      create :book, email: "guilherme@guilherme.com.br"
      create :book, email: "bruno@eder.com"
      create :book, email: "guilherne@eder.com"
      expect(Book.search_by_email("eder").length).to eq 3

    end
  end

  describe "book_has_commentary" do
    it "should find a book`s commentaries" do
      create :book, email: "bruno@bruno.com.br"
      create :book, email: "eder@eder.com"
      create :book, email: "guilherme@guilherme.com.br"
      create :book, email: "bruno@eder.com"
      create :book, email: "guilherne@eder.com"
      expect(Book.search_by_email("eder").length).to eq 3

    end
  end
end
