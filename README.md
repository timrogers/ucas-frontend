# UCAS Track Scraper (Frontend)

I created a [script](https://github.com/timrogers/ucas) which reads from the UCAS Track system used for UK university applications, sends notifications of any offers and stores the data in a Redis database. This Sinatra application allows you to read and then show that data on a pretty web page.

## Setup

* Set up the [scraper](https://github.com/timrogers/ucas) and get it running - you'll need the data from that and the script running frequently to provide the data for these pages.

* Clone the Sinatra application from the Git repository

`git clone git://github.com/timrogers/ucas-frontend.git`

* Head into the directory, and then run `bundle install` to install the relevant dependencies

* Make any customisations you want to the design in views/index.erb - at the very least, you'll want to add your name and the like.

* Run the application - it's in app.rb, so you can simply run `ruby app.rb` and that'll do it. For production use, you'll want something more robust in all likelyhood than the default Sinatra server.

I run this application in the default Sinatra server behind an Apache mod_proxy proxy because I'm very lazy. If you have any sense, you won't do this to be honest.

## Dependencies

This doesn't use too many other gems, but for clarity, I'll list them all and explain their purpose.

* __sinatra__ - An awesome framework for Rack web apps - try it.
* __redis__ - Awesome key-value storage for database win. This is where the main script stores all its data.
* __redis-namespace__ - Easier versioning for the application, meaning the dataset can change as I update things
* __json__ - Objects are stored in Redis as lovely JSON, and must be brought back into Ruby form

## Try it out

I have this running on my server at [http://ucas.tim-rogers.co.uk](http://ucas.tim-rogers.co.uk) - feel free to check it out/see how my university application is going.