require "test_helper"
require 'open-uri'

class CanSignUpTest < Capybara::Rails::TestCase
  setup do
    author = Author.new
    author.first_name = "William"
    author.last_name = "Shakespeare"
    author.bio = "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist. He is often called England's national poet, and the 'Bard of Avon'. "
    author.photo = "#{Rails.root}/test/fixtures/kitty.jpg"
    author.save

    book = Book.new
    book.title = "Hamlet"
    book.price = "5.00"
    book.author_id = Author.first.id
    book.photo = "#{Rails.root}/test/fixtures/kitty.jpg"
    book.save
  end

  test "Can sign up" do
    visit('/sign_up')
    within("#new_user") do
      fill_in "Name", with: "bob"
      fill_in "Email", with: "bob@example.com"
      fill_in "Password", with: "12345678"
      click_button "Create User"
    end
    assert_content page, "bob"
  end
end
