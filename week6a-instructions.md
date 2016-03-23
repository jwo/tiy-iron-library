# Rails: Moving into Advanced
## Intro to Testing - Feature (end to end) testing
##### Due Wednesday, March 09, 2016  
###### Testing is way super important in creating maintainable applications -- that is, applications that don't seem to break every time you use them.

Rails and Ruby have testing built in; you'll create a Rails app that tests itself.

1. Update your iron-library by adding automated testing
2. Adding `minitest-rails-capybara` to your gemfile, write a Feature test that describes the behavior when you add a book
3. It should start on the homepage, click "Add new book", fill in the form, hit submit, and test that you see the title on the homepage
4. I should run "rake" and see the tests run
