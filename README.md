Programation Test GAP
----------------------------------------------

This is a really simple code to be able to CRUD People from DB, this code also send an email to all people in the DB when a new people is create, and send a new email when a person is deleted to all people in db as well, this emails sending is async so happens in a background process using resque, the styles are from bootstrap and some custom for the profile.

Project delivery date.
----------------------------------------------
Monday, 7 November, 2016

The installation process
----------------------------------------------

First step in the instalation proces is to install redis, this is for been able to run the email sending async, so the user can navigate the site without having to wait until the all email sending process finish, also need to install foreman to be able to start all services with a single console command.
```
$ brew install redis
$ brew install foreman
```

__please make sure you have git, ruby(rbenv or rvm whatever works for you), also need to have mysql installed on your system FOR ALL THIS PREREQUISITES YOU CAN FOLLOW THIS TUTORIAL [sweet tutorial](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)__

you need to clone this project, using this syntax to do so `git clone https://github.com/aradiquez/GAPTest.git` then we need to start the db, we need to go using the console to `cd path/where/this/project/was/clone/` and do `bundle install` to install all gems and requirements, after everything is green, you can run this command to create the db `rake db:create` this will create an empty db, after that you need to run `rake db:setup` this will run migration and run the seed data to create the 20 testing users 😊

then at this point running `rake test` will run the test suite, everything should be green 🙂

this is the command you need to run in the terminal `foreman start` to make everything start then you can now go to `localhost:3000` and play with the app.

Troubleshooting
----------------------------------------------

shoot me an email shagy.gnx@gmail.com - or Skype @Aradiquez