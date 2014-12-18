## MustDU 

MustDU is an application that allows users to create their own self-destructing must-do lists.

You can visit MustDu live at: https://mustdu.herokuapp.com/

As a developer, here's how you can test drive the application:

- [Git clone](https://github.com/hpjaj/mustdu.git) the repository
- Run `$ bundle`
- Migrate and seed the SQLite3 databases (`rake db:migrate` and `rake db:seed`)
- Start the server, `$ rails s`, and browse to `localhost:3000` 
- Sign up for an account
  - Create to-do lists items
  - Mark to-do list items as complete
- To run the feature specs, call `$ rspec` from the command line

Setup
- Have a config/application.example.yml file to illustrate the storing of ENV variables
- config/application.yml stores variables and is in .gitignoref

### JavaScript Testing with PhantomJS

PhantomJS is required to run JavaScript-dependent specs. 

#### Install PhantomJS on Ubuntu

SSH into your Vagrant Virtual Machine if you're using one, then run the following commands to install [PhantomJS](http://phantomjs.org/):

```
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install nodejs
npm install -g phantomjs
```
