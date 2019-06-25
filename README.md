# MyBlog

A Rails application.

## Setup

* Clone the repository
```sh
$ git clone ssh://github.com/jahid90/MyBlog.git
```
* Start the db and web service
```sh
$ sudo docker-compose up -d
```
* Create and migrate the db
```sh
$ sudo docker-compose run web rake db:create
$ sudo docker-compose run web rake db_migrate
```
* Launch the browser and point to: http://localhost:3000
