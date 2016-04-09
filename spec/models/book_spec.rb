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
    it "should find a book" do
      create :book, owner: "bruno"
      create :book, owner: "eder"
      create :book, owner: "teste"
      create :book, owner: "bruno"
      expect(Book.search_by_owner("bruno").length).to eq 2

    end
  end
end
