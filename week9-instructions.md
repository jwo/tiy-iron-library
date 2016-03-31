# IronLibrary: Add Checkouts
## Adding the capability to checkout a Book from our ironlibrary (without costs, for now)
##### Due Thursday, March 31, 2016  Finishing Touches on Rails
Taking your existing IronLibary application, we're going to enhance it with the following:

## Normal Mode
1. Allow a user to add a Book to their Shopping Cart
2. Allow a user to view their shopping cart and see the books in their cart
3. Allow user to complete the checkout by clicking `Checkout`
4. Send the user an email receipt with the books
5. Add a Feature test that confirms the book was checked out by the user


Tips:
* You'll want models for both "Order" and a "OrderItem"
* You'll want to hook up SendGrid heroku addon to be able to send emails
* Once a cart is complete (ie it has been completed), the order status should change from "pending" to "complete"


## Adventure Mode
* Add inventory to the Book and only let you checkout if `inventory > 0`
* Add the ability to check in a book
* Add the ability to see if a book is late, and send an email notification if it is late
