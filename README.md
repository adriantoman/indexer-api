# About

This is example Rails API application. The purpose of this APP is to parse HTML content and save it do the database for later listing.

# Ruby version 

This Rails up was developed on ruby 2.4.0, but it is compatible with all 2.0+ rubies

# Configuration

Before running the application you need to install all dependent gems. Run this command:

    bundle install

### Database creation

Before running the APP for the first time, database need to be created. Do it by running this command:
    
    rails db:migrate

### Running the APP

Now you can simply start the Rails server by typing. 
    
    rails s
    
This will start the rails in development mode, but for testing purposes it is enough.

# How it works

After starting, the rails application will be accessible on default port 3000.(This can be change by PORT enviroment variable).

The app is publishing one endpoint /pages and it is accepting two types of calls.

## GET /pages

This request will return already parsed pages. The result will look like this:

    [{
        "url":"http://games.tiscali.cz",
        "page_elements":[
            {"content":"Top články","element_type":"h2"},
            {"content":"Výpis článků podle data","element_type":"h2"},
            {"content":"Bleskovky","element_type":"h2"},
            {"content":"https://www.seznam.cz","element_type":"link"}
        ]
     }]

## POST /pages

This request is for doing HTML pages parsing. The post requires *url* param. The URL parameter must be valid URL and start with http or https.

You can test this endpoint for example by this curl command:
    
    curl -d "url=https://www.google.com" -X POST http://localhost:3000/pages

If everything went ok, the entpoint will return status OK

    {"status":"ok"}
    
If there was some error in the process, the endpoint will return various error messages

    {"message":"Param 'url' not found","status":"error"}

# Test suite

This project is covert by set of RSpec tests. For running the tests you first need to initialize test database. You can do it by following command:

    RAILS_ENV=test rails db:migrate
    
Then you can run the test suite by typing this command:
    
    bundle exec rspec

