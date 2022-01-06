# README

Generated with this command: `rails new --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-storage --skip-action-cable --skip-hotwire --skip-active-job`

## Controlling the app with docker-compose

- Before anything else, build the docker image: `docker-compose build`
- Start the Rails app server: `docker-compose up`
- Run the tests: `docker-compose run web rails test`
- Generate a new model: `docker-compose run web rails generate model restaurant name:string`
- Run migrations: `docker-compose run web rails db:migrate`

## Challenge

Create a CR(UD) application to manage menus for restaurants.

### Acceptance criteria

- Add three menu types: Starters, Mains, and Desserts
- Allow the user to add dishes to these menus
  - Dishes should have name and price
- Add a JSON API endpoint that exposes all menus and their dishes
- Add tests for the files you created
- No need to support updating or deletion of dishes or menus
- The app only supports one restaurant, no need to support more

Example API output:

```json
{
  "starters": [
    {
      "id": 1,
      "name": "Soup",
      "price": 3
    }
  ]
}
```
