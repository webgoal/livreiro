require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :author => "Author",
      :publisher => "Publisher",
      :owner => "Owner",
      :email => "Email",
      :abstract => "Abstract"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Abstract/)
  end
end
