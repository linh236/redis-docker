# README

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

* docker build -t redis_image ./redis/.
docker run --network rails --name redis_app -p 6400:6400 -d redis_image

* ...
