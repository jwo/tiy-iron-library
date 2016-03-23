# Rails: Moving into Advanced
## Authentication and before_actions
##### Authentication (and protecting content) is very very common.
Write a feature test to your iron-library that confirms the following workflow (in a pull request):

1. Visit the root path and see some books
2. Click on a book's title
3. I should be on the sign in page
4. I enter the correct username and password
5. (back on the root path) I click on a book's title
6. I should be on the book's show page and can see the title


## Hard Mode
1. Instead of redirecting me to the root path after signing up, end up on the book's title page (the page that was requested)
2. Let the user sign-up in addition to signing in


## Epic Mode
1. Store the password using `has_secure_password`
