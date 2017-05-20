# Potluck Party!

## Summary

This is a practice web-stack application built in Sinatra. It was built from scratch utilizing controllers, views, user authentication, database migrations, model validations, associations, etc.

### Web Application Overview
This is a site to organize [potluck dinners][].  Users will be able to host and attend dinners. 

### Setup
This application is run from localhost. Make sure that everything is set up before running the application: install any necessary gems, create the database, run the migrations, and seed the database.  From the command line, navigate to the `potluck-party` directory and run ...

0. `$ bundle install`
0. `$ bundle exec rake db:create`
0. `$ bundle exec rake db:migrate`
0. `$ bundle exec rake db:seed`

### User Registration
On the homepage, you will find a "register" link.  Clicking the link takes the user to a page with a form for creating a new account.  Users must register with an e-mail address, a username, and a password.  The e-mail address and username must be unique.

If registration is unsuccessful, the user will see the registration form and the associated error messages.  If registration is successful, the user is considered logged in and redirected to the homepage where the "register" link is replaced with the user's username.

### Login/Logout
Once a user has been registered, they are allowed to login and logout. Clicking the login link from the homepage takes the user to a page with a form for logging in.  Users sign in with an e-mail address and password.

If login is unsuccessful, the user will see the login form and an error message.  If login is successful, the user is considered logged in and redirected to the homepage where the "login" and "register" links are replaced with the user's username and a "logout" link. Clicking the "logout" link logs the user out and redirects the user back to the homepage.  

### Hosting Potlucks
Registered users are allowed to host potlucks. Logged-in users will see a "host a potluck" link on the homepage. Clicking the link takes the user to a form. The form collects the date, time, and location of the potluck.

When the form is submitted, if adding the potluck is unsuccessful (e.g., failing a validation), the user will see the form and the associated error messages. If adding the potluck is successful, the user will be redirected to a page showing the potluck's details. Each potluck is associated with the user who added it.

### Browsing Potlucks
Potlucks are listed on the homepage for any visitor to browse. Only potlucks that have not started are listed, and they are ordered by starting time. Each potluck's name, location, and start time is displayed. The potluck's name is a link, and clicking the link takes the user to a page showing the potluck's details.

### Editing a Potluck's Details
On the page showing a potluck, if a logged-in user is also the potluck's host, the user will see an "edit" link. Clicking the link takes the user to a form for editing the potluck. The form is populated with the potluck's current details. Submitting the form makes a request to update the potluck.

If the update is unsuccessful, the user will see the form and the associated error messages. If updating the potluck is successful, the user is redirected to a page showing the potluck's details.

### Deleting a Potluck
In the same way that users might need to edit a potluck, they might also need to delete a potluck. Users are allowed to delete potlucks which they've previously added.

On the page showing a potluck, a "delete" button appears next to the "edit" link for any potlucks the user added. Clicking the button will delete the potluck and redirect the user back to the homepage.

*Note:* The "delete" button is part of a form used to submit a RESTful request to delete an item. It is styled to look like a link.

### Attending Potlucks
Logged-in users can attend potlucks. Any registered user can attend any potluck. The page showing a potluck will also display a list of the attendees and what food they will bring to share. If a user is logged in but not the host, then a form that allows users to sign up to attend a potluck will be displayed.  When a user signs up, the user must specify a food to bring, and the same food cannot be brought to the same potluck by multiple users (i.e., two users cannot sign up to bring Jell-O to the same potluck).

When submitting the form, if the attendance is unsuccessfully created, the user will see the potluck page with the form and the associated error messages.  If the attendance is successfully created, the user is redirected to the potluck's show page. Instead of seeing a form for signing up to attend, the user will be reminded what food they have committed to bring.

[potluck dinners]: https://en.wikipedia.org/wiki/Potluck
