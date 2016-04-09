require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validate_password" do
    it "should match password in the DB" do
      book = create :book, answer: "teste123"
      book.answer = 'teste1234'
      expect(book.valid?).to be false
    end
  end

end
