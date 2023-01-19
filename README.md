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

## TODO List (stack ranked)

 - Cache account details, access token and such things to speed up requests
 - Add fake pagination to the transactions page
 - Make multiple payments at the same time
 - Make transaction pagination work
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
 - Show beneficiaries
 - Make a payment
 - Make it less fugly

 ## Thought Process/Approach

 I treated this as though I would be demoing it to stakeholders in the bank as a "here is a starting point that we're giving developers to work with". Making it look good is less important for the devs who would be using it, but IMO important for a demo to the bank.
 
 The idea was to create something that showed what the API could do, without getting fancy. So Slack integration didn't really make sense to me. Multiple payments is just a hassle from a UI/UX point of view and doesn't really add much to the functionality.

 The main thing that I was sad about not adding was caching. The API is pretty slow and the very inefficient approach to using it makes things seem laggy and annoying.  I'd probably be able to improve that a lot in about 30 min or an hour of work.

 I don't like hard-coding things like API keys (because it's really bad practice), so I spent some effort to make the login flow. I think this would also make the demo a lot nicer, because you could demo with a real bank account and/or multiple accounts. 
 
 In the interest of simplicity, I didn't add any DB models. Doesn't make things that much simpler 🤷‍♂️.

## Chronology

 - Spent about 30 minutes trying to get API to work before concluding something was wrong
 - Checked in with Nick B, got confirmation from him that account was fine, found issue (about 15 min)
 - Basic API wrapper in ruby (about 20 min)
 - Minimalist app with account and transactions, simple cookie-based login/logout (About an hour)
 - Beneficiaries and payments (about an hour)
 - Make it look a bit nicer; finish documentation (about an hour)

## Docs Still to be written

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...