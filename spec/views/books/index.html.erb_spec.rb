require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Title",
        :author => "Author",
        :publisher => "Publisher",
        :owner => "Owner",
        :email => "Email",
        :abstract => "Abstract"
      ),
      Book.create!(
        :title => "Title",
        :author => "Author",
        :publisher => "Publisher",
        :owner => "Owner",
        :email => "Email",
        :abstract => "Abstract"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Abstract".to_s, :count => 2
  end
end
