# README

This app is a proof-of-concept built primarily to showcase the capabilities of the Investec Programmable banking API.

## Prerequisites

You'll need to have a ruby version manager installed that respects the .ruby-version file. [Rbenv](https://github.com/rbenv/rbenv) is recommended, along with [Ruby-build](https://github.com/rbenv/ruby-build#readme).

## Get Started

```
rbenv install
bundle install
rails s
```

Now click [here](http://localhost:3000)

## TODO List

 - Make a payment
 - Show beneficiaries
 - Make multiple payments at the same time
 - Make it less fugly
 - Cache account details, access token and such things to speed up requests
 - Add pagination to the transactions page


 ### Original List

- I can sign in and set my API keys, and sign out
- I can see a list of all my historical transactions, in a paginated list
- I can see a list of all my beneficiaries
- I can choose a beneficiary and make a payment to them.
- I can choose multiple beneficiaries at once and make payments to them.
- When I make a payment, I should see the transaction in my transactions list
- I get a warning message if I’ve already paid a beneficiary and I’m trying to pay them again
- I can add a Slack webhook URL to get notified when I make a transaction

## Done

 - Basic API interaction in a lib
 - Simple landing page showing Accounts
 - Click from account through to see transactions 
 - "Log In" by entering API keys, save in Cookies
 

## Chronology

 - Spent about 30 minutes trying to get API to work before concluding something was wrong
 - Checked in with Nick B, got confirmation from him that account was fine, found issue (about 15 min)
 - Basic API wrapper in ruby (about 20 min)
 - Minimalist app with account and transactions, simple cookie-based login/logout (About an hour)

## Docs Still to be written

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...