Check list 

Users
[X] Has first and last name
[X] Has email
[X] Has password that is crypted
[X] Has phone number
[X] Can Signup
    [X] vaildates user attributes before saving
    [X] form is pre-filled when user is directed back because of a vaildation error
    [X] Shows error and success messages
[X] Can Login
    [X] vaildates user based on email & password
    [X] shows error and success messages
[] Can Logout
    [X] logs out user based on session[:user_id]
    [X] redirects to a homepage or login page
    [] shows error and success messages
[X] Can use another service to signup/login/logout
[x] Relations between other models
[x] view all orders made

Pizza
[X] Attributes
    [X] name
    [X] description
    [X] size (will be a collection with a default)
    [X] timestamps
[x] Pizza created by user or admin can be added to an order through an order form
[] CRUD
    [/] Create a new pizza
        - Pizza needs to be assoicated with the user that created it.
        - Form will probably need to be accessed on user's order form (nested resources?)
    [] Read all on menu page and show page
    [] Update name, description, size
    [] Delete - only by the creator and/or admin

Orders
[x] associations
    [x] belongs_to :user
[] attributes
    [x] notes
    [] status
[x] show all pizzas added to order
[x] can be "placed"
[] more pizzas can be added


Reviews (stretch goal)