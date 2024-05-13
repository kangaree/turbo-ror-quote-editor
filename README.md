# Quote editor

This is a single-page, reactive quote editor made with only a single line of 
custom JavaScript.

I'm following the [Turbo Rails Tutorial](https://www.hotrails.dev/).

It's been a bit since I've worked with Rails closely. 

Rails is a joy to work with and convention over configuration means you build fast.
Combined with the SPA features of Turbo, I think I'll try building with this
framework more often!

## Setup

Clone the repository

```
git git@github.com:kangaree/turbo-ror-quote-editor.git
cd turbo-ror-quote-editor
```

First, install the gems required by the application:

```
$ bundle install
```

Initialize the database

```
$ bin/setup
```

Start rails server

```
$ bin/dev
```

Start Redis server

```
$ redis-server
```

You can find your app now by pointing your browser to http://localhost:3000.

Run Test

```
$ bin/rails test:system
```

