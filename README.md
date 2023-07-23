# RESTful API (Rails application with two related models)

# Description

There is two tables:

__servers__
| column |  type     |
|--------|-----------|
| id     | Serial    |
| name   | String    |

__bandwiths__
|     column        |  type     |
|-------------------|-----------|
| id                | Integer   |
| server\_id        | Serial    |
| interface\_name   | String    |
| Value             | Float     |
| value\_id         | Serial    |

So, we stores servers info (first table) and bandwiths of their interfaces (second table)

There is some rules:
* one server can have several interfaces.
* name of bandwiths interfaces must be uniq for specific server.
* after removing any server, bandwiths of that server must be removed to.

# Needs

- RESTful API for `servers` and `bandwiths` entities

- Test coverage of application

# Smoke

`git clone https://github.com/dmproger/restful`

`cd restful`

`bundle`

`bundle exec rspec`

For more details see `spec` folder

# Versions

Ruby 3.1.2, Rails 7.0.6, Bundler 2.4.7

# Notes

This tastcase was given at [First Channel Russia](https://www.1tv.com) interview with needs to implement `GET` and `DELETE` of REST methods only.

I extend it to RESTful API version with `POST` and `PUT` methods as well

Some solutions here are more creative than a regular code. I made it because of code variety and just for fun.
