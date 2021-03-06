Food Shift Web App
====

What is Food Shift?
----
![Banner](http://occupyoakland.org/wp-content/uploads/2012/11/Food-Shift-Logo1.png "Food Shift Logo")

**[Food Shift](http://www.foodshift.net/)** is a nonprofit organization based in Oakland works collaboratively with communities, businesses and governments to develop long-term sustainable solutions to reduce food waste and build more resilient communities.  With an estimated 25% of food purchased being thrown away despite millions of Americans being food inseecure, there is definitely a problem.  Food Shift is trying to fix this problem through two approaches: education and awareness campaigns, and food recovery programs.

What We Are Doing
----
Blueprint is creating a web application to help coordinate the food recovery efforts.  The application will allow potential food donors to easily and efficiently set up one-time or recurring food donations, potential food recipients to find out and sign up for food donations, and food shifters to help move food from donors to recipients.

Who We Are
----
![bp](http://bptech.berkeley.edu/assets/logo-full-large-d6419503b443e360bc6c404a16417583.png "BP Banner")

**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to their desire to see social good enacted in their community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.

Setup
-----

Firstly, make sure you have Ruby, Rails, and PostgreSQL set up correctly on your computer.

1.  Clone the Github repo `git clone git@github.com:calblueprint/foodshift.git`
2.  Install all appropriate gems `bundle install`
3.  Create `config/database.yml` using the template at `config/database.yml.sample`.  You may need to create a new Postgres user; there's some information [here](http://stackoverflow.com/questions/16973018/createuser-could-not-connect-to-database-postgres-fatal-role-tom-does-not-e/16974197#16974197) if you run into issues.
4.  Create `config/application.yml` using the template at `config/application.yml.sample`.  This requires you to extract your AWS keys, and use a email account that you want to use.  Be aware that if you're using Gmail, there might be issues with authentication.  I didn't really have a good way to work around this.
5.  Run `rake db:create` and `rake db:migrate` to set up the database completely.  If you want to prepopulate the database with dummy data, you can use `rake db:populate`.  See the file in `lib/db.rake` to learn more about the dummy data inserted.
6.  Run `rails s` to start the server, and then navigate to `localhost:3000` to see the website running on your computer!
