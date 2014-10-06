## MUSTDU: An application that allows users to create their own self-destructing must-do lists.

Setup
- Have a config/application.example.yml file to illustrate the storing of ENV variables
- config/application.yml stores variables and is in .gitignoref


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration


* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


## JavaScript Testing with PhantomJS

PhantomJS is required to run JavaScript-dependent specs. 

### Install PhantomJS on Ubuntu

SSH into your Vagrant Virtual Machine if you're using one, then run the following commands to install [PhantomJS](http://phantomjs.org/):

```
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install nodejs
npm install -g phantomjs
```
