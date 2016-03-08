require "test_helper"

class AddBookTest < Capybara::Rails::TestCase

  setup do
    Author.create! first_name: "Emily", last_name: "Ritter", bio: "Emily is blah blah blah. Not a real author. At least not in the regard this is referring to."
  end

  test "Add Book" do
    visit root_path
    within "header" do
      first(:link, "add").click
    end

    within("#new_book") do
      fill_in "Title", with: "I'm a New Book"
      fill_in "Price", with: "4.99"
      fill_in "Photo url", with: "http://ecx.images-amazon.com/images/I/51RN2Q74BYL._SX334_BO1,204,203,200_.jpg"
      select("Emily Ritter", from: "Author")
      click_button "Create Book"
    end
    visit root_path
    assert_content page, "I'm a New Book"
  end

end
