require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    books = [create(:book), create(:book)]
    assign(:books, books)
  end

  it "renders a list of books" do
    render
    assert_select "tr>td>a", :text => "Edit".to_s, :count => 2
  end
end
