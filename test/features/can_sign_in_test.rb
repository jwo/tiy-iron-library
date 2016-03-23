require "test_helper"
require 'open-uri'

class CanSignInTest < Capybara::Rails::TestCase
  setup do
    User.create! name: "Bob", email: "bob@example.com", password: "12345678"

    author = Author.new
    author.first_name = "William"
    author.last_name = "Shakespeare"
    author.bio = "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist. He is often called England's national poet, and the 'Bard of Avon'. "
    author.photo = "#{Rails.root}/test/fixtures/kitty.jpg"
    author.id = 1
    author.save

    book = Book.new
    book.title = "Hamlet"
    book.price = "5.00"
    book.author_id = 1
    book.photo = "#{Rails.root}/test/fixtures/kitty.jpg"
    book.save
  end

  test "Can sign in" do
    visit root_path
    click_link "Hamlet"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Bob"
  end

end
