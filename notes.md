Check list 

Users
[X] Has first and last name
[X] Has email
[X] Has password that is crypted
[X] Has phone number
[] Can Signup
    [X] vaildates user attributes before saving
    [X] form is pre-filled when user is directed back because of a vaildation error
    [] Shows error and success messages
[] Can Login
    [] vaildates user based on email and password
    [] shows error and success messages
[] Can Logout
    [X] logs out user based on session[:user_id]
    [X] redirects to a homepage or login page
    [] shows error and success messages
[] Can use another service to signup/login/logout
[] Relations between other models
    [] has_many pizzas
    [] has_many pizzas, through orders
    [] has_many reviews (stretch goal)

Pizza
[] Attributes
    [] name
    [] description
    [] size (will be a collection with a default)
    [] timestamps
[] Can be added to an order through an order form
[] CRUD
    [] Create a new pizza
        - Form will probably need to be accessed on user's order form (nested resources?)
    [] Read all on menu page and show page
    [] Update name, description, size
    [] Delete - only by the creator and/or admin

Orders

Reviews (stretch goal)