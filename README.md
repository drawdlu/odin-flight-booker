# Odin Flight Booker

A one-way flight booker application that allows users to book on a specific date or airport.

## Features
### Searching for a flight
- Number of passengers is required
- Choose between a combination of flight data (departure airport, arrival airport, date)
- Click "Find Flights" to trigger database search

### Choosing a flight
- It will indicate if there is no flight for the combination of data chosen
- Click on the radio button to choose a flight and click on "Book"

### Entering passenger information
- This page will display the flight information
- Enter name and email of each passenger
- Number of input pairs will depend on number of passengers chosen
- Press "Confirm" to book the flight

### Successfully booking a flight
- After confirming the booking it will display the flight information together with the passenger information 
- A flash notice will also appear indicating a successful booking

## How to install
- Clone this repository
- Install ruby and rails
- Install bundler
    - `$ gem install bundler`
- Install PostgreSQL
- Navigate to your cloned repository
    - `$ cd private-events`
- Install all dependencies
    - `$ bundle install`
- Migrate database
    - `$ bin/rails db:migrate`
- Run server
    - `$ bin/rails s`
- On your browser enter `http://localhost:3000/`


This is part of The Odin Project curriculum: 
https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker
