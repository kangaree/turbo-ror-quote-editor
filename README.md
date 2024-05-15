# Quote editor
[Live Demo](https://turbo-quote-editor.fly.dev/)

This is a single-page, reactive quote editor made with only a single line of 
custom JavaScript (for message animations).

I followed the [Turbo Rails Tutorial](https://www.hotrails.dev/).

## Setup

Clone the repository

```
git clone git@github.com:kangaree/turbo-ror-quote-editor.git
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

