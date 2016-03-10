require "test_helper"

class AddBookTest < Capybara::Rails::TestCase

  setup do
    Author.create! first_name: "William", last_name: "Shakespeare", bio: "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist. He is often called England's national poet, and the 'Bard of Avon'. ", id: 1
    User.create! name: "Bob", email: "bob@example.com", password: "12345678"
  end

  test "Add Book" do
    visit root_path
    within "header" do
      first(:link, "add").click
    end

    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    within "header" do
      first(:link, "add").click
    end

    within("#new_book") do
      fill_in "Title", with: "I'm a New Book"
      fill_in "Price", with: "4.99"
      fill_in "Photo url", with: "http://ecx.images-amazon.com/images/I/51RN2Q74BYL._SX334_BO1,204,203,200_.jpg"
      select("William Shakespeare", from: "Author")
      click_button "Create Book"
    end
    visit root_path
    assert_content page, "I'm a New Book"
  end

end
