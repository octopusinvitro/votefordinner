[![Build Status](https://travis-ci.org/octopusinvitro/voting.svg?branch=master)](https://travis-ci.org/octopusinvitro/voting)
[![build status](https://gitlab.com/me-stevens/voting/badges/master/build.svg)](https://gitlab.com/me-stevens/voting/commits/master)


# Readme

A project to play with Sinatra.

![Screenshot](screenshot.png)


## How to use this project

This is a Ruby project.
You will need to tell your favourite Ruby version manager to set your local Ruby version to the one specified in the `.ruby-version` file.

For example, if you are using [rbenv](https://cbednarski.com/articles/installing-ruby/):

1. Install the right Ruby version:
```bash
$ rbenv install < VERSION >
$ rbenv rehash
```
1. Move to the root directory of this project and type:
```bash
$ rbenv local < VERSION >
$ ruby -v
```

You will also need to install the `bundler` gem, which will allow you to install the rest of the dependencies listed in the `Gemfile` file of this project.

```bash
$ gem install bundler
$ rbenv rehash
```


### Folder structure

* `bin `: Executables
* `lib `: Sources
* `spec`: Tests


### To initialise the project

```bash
$ bundle install
$ bundle exec rake
```


### To run the tests

```bash
$ bundle exec rspec --color
```


### Another way of running them

```bash
$ bundle exec rake
```

### To run the app

Make sure that the `bin/app` file has execution permissions:

```bash
$ chmod +x bin/app
```

Then just type:

```bash
$ bin/app
```

Open your browser and go to http://localhost:4567/


### Another way of running it

Update the `config.ru` file, then type

```bash
$ rackup
```

Open your browser and go to http://localhost:9292/


## Comments

* I don't know if this is a good practice, but I am moving all the requires to the `bin/app` file (and the `config.ru` file, in case you use that to run the app).
Then, to make it work for the tests, I also put them in the `spec/spec_helper`.
I think it is clearer and more explicit that having to search for requires inside files and maybe end up with duplication (like requiring the same file in different files, etc.)

* I have to add the modules in the `config.ru` with `extend` because `include` throws an error. It works in `bin/app`, though.

* The assets module has to be included inside of a class or it won't work. That's because of the `included` method, which takes the class as an argument.

* All the texts are in a `lib/messages.rb` file. Maybe that make it easier for translations? Also separates the strings from the business logic.


## Todo

* [ ] Make Sinatra use sass with sprokets (apparently another gem has to be added, `sprockets-sass`, which is stupid, because sass can do sass things! I may drop sprockets)
* [ ] Fix the radio buttons, for some reason the `:after` pseudo-element is not showing.
* [x] Find out why the cast page container is wider than the other pages.

## License

[![License](https://img.shields.io/badge/gnu-license-green.svg?style=flat)](https://opensource.org/licenses/GPL-2.0)
GNU License
