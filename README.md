# Rails Code Challenge Prep - Songs By JT

For this assessment, you'll be working with domain for Justin Timberlake superfans.

In this repo, there is a Rails application with some features built out. There
is also a fully built React frontend application, so you can test if your API is
working.

Your job is to build out the Rails API to add the functionality described in the
deliverables below.

## Setup

To download the dependencies for the frontend and backend, run:

```sh
bundle install
```

**THIS WILL NOT WORK (SKIP)** 
```sh
npm install --prefix client
```

There is some starter code in the `db/seeds.rb` file so that once you've
generated the models, you'll be able to create data to test your application.

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```sh
rails s
```

You can run your React app on [`localhost:4000`](http://localhost:4000) by running:

**THIS WILL NOT WORK (SKIP)** 
```sh
npm start --prefix client
```

You are not being assessed on React, and you don't have to update any of the React
code; the frontend code is available just so that you can test out the behavior
of your API in a realistic setting.

**THIS WILL NOT WORK (SKIP)** 

There are also tests included which you can run using `rspec` to check your work.

Depending on your preference, you can either check your progress by:

- Running `rspec` and seeing if your code passes the tests
- Running the React application in the browser and interacting with the API via
  the frontend
- Running the Rails server and using Postman make requests

## Models

You need to create the following relationships:

- A `Song` has many `SuperFan`s through `Review`
- A `SuperFan` has many `Song`s through `Review`
- A `Review` belongs to a `Song` and belongs to a `SuperFan`

- A `SuperFan` also belongs to a single favorite JT `Song`
- A `Song` has many fans who have marked it as their favorite

Start by creating the models and migrations for the following database tables:

![domain diagram](domain.png)

If you use a Rails generator to create the models, make sure to use the
`--no-test-framework` flag to avoid overwriting the test files.

Add any code needed in the model files to establish the relationships.

Then, run the migrations and seed file:

```sh
rails db:migrate db:seed
```

> If you aren't able to get the provided seed file working, you are welcome to
> generate your own seed data to test the application.

## Validations

Add validations to the `Review` model:

- must have a `rating` between 1 and 10
- A SuperFan can only leave a review once per song.

## Routes

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

### GET /songs

Return JSON data in the format below:

```json
[
  {
    "id": 1,
    "name": "Sottocasa NYC",
    "address": "298 Atlantic Ave, Brooklyn, NY 11201"
  },
  {
    "id": 2,
    "name": "PizzArte",
    "address": "69 W 55th St, New York, NY 10019"
  }
]
```

### GET /songs/:id

If the `Song` exists, return JSON data in the format below:

```json
{
  "id": 1,
  "name": "Sottocasa NYC",
  "address": "298 Atlantic Ave, Brooklyn, NY 11201",
  "pizzas": [
    {
      "id": 1,
      "name": "Cheese",
      "ingredients": "Dough, Tomato Sauce, Cheese"
    },
    {
      "id": 2,
      "name": "Pepperoni",
      "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
    }
  ]
}
```

If the `Song` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Song not found"
}
```

### DELETE /super_fan/:id

If the `SuperFan` exists, it should be removed from the database, along with
any `review`s that are associated with it (a `review` belongs
to a `SuperFan`, so you need to delete the `review`s before the
`SuperFan` can be deleted).

After deleting the `SuperFan`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `SuperFan` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "SuperFan not found"
}
```

### GET /pizzas

Return JSON data in the format below:

```json
[
  {
    "id": 1,
    "name": "Cheese",
    "ingredients": "Dough, Tomato Sauce, Cheese"
  },
  {
    "id": 2,
    "name": "Pepperoni",
    "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
  }
]
```

### POST /restaurant_pizzas

This route should create a new `RestaurantPizza` that is associated with an
existing `Pizza` and `Restaurant`. It should accept an object with the following
properties in the body of the request:

```json
{
  "price": 5,
  "pizza_id": 1,
  "restaurant_id": 3
}
```

If the `RestaurantPizza` is created successfully, send back a response with the data
related to the `Pizza`:

```json
{
  "id": 1,
  "name": "Cheese",
  "ingredients": "Dough, Tomato Sauce, Cheese"
}
```

If the `RestaurantPizza` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["validation errors"]
}
```

## Custom Rout


### GET /song/top_charts

Finds the song with the most reviews and returns 
JSON data in the format below:


```json
  {
    "id": 1,
    "name": "Sottocasa NYC",
    "total_reviews": 7,
    "average_rating": 3
  },
```
