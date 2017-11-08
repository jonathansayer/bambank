# README

Built with ruby 2.3.3 and Rails 5.1.4

To setup

```
gem install bundler
bundle install
rake db:create
rake db:migrate
rails s
```

Go to localhost:3000

# Assumptions

- A user can have a nagative balance.
- A user can transfer with a negative balance
- Transfer amounts are limitless
- Any number of transfers can be created
- A transfer is only between two registered users
