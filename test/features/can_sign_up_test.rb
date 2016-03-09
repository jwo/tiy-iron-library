require "test_helper"

class CanSignUpTest < Capybara::Rails::TestCase
  setup do
    book.Create! title:"Hamlet", photo_url:"http://t0.gstatic.com/images?q=tbn:ANd9GcSJC7FDq-z6NlSNw-45Ra_v3wDYqU3BPHdxEQyTVPzC99vj9D6R", price:"5.00", author_id: 1
    author.Create! first_name: "William", last_name: "Shakespeare", bio: "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist. He is often called England's national poet, and the 'Bard of Avon'. "
  end

  test "Can sign up" do
    visit root_path
    click_link "Hamlet"
    within("#new_user") do
      fill_in "Name", with: "Bob"
      fill_in "Email", with: "bob@example.com"
      fill_in "Password", with: "12345678"
      click_button "Sign Up"
    end
    assert_content page, "Bob"
  end
end
