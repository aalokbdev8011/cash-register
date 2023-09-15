# Cash Register App
## _A Ready to use, shopping cart app for your business_

Cash Register is a Wep Application for full filling e-commerce busiiness needs. Developed using below Tech-Stack:

- Rails 7 (Utiling Hotwire features)
- Dynamic Page updated
- Ruby-3.2.2

## Features

- User can add products from the list available on home page to his cart, which does not require any login.
- Products can be added/updated/deleted in app using admin panel.
- Products quantity can be altered any time before user place order.
- Price for product is decided dynamically, which depends upon product offers.
- Offers on products can add/updated/delete to app using admin panel.
- If more then 1 offer applies to product on given quantity, then lowest price amongs them will be considered.
- Once order is placed, Admin can view new offer created in admin panel for delivery.

## Installation

Cash Register requires requirs **Rails7**, **Ruby-3.2.2** and **PostgreSQL** on system to run.
Follow belows commands to setup the project.

```sh
git clone https://github.com/aalokbdev8011/cash-register.git
cd cash-register
bundle install && yarn install
rails db:setup
rails db:seed
```

Once the commands successfully run on terminal, hit `bin/dev` to kick start the server.
Go to the browser and check `localhost:3000/` to use Cash Register

### Credentials to access admin panel:
Email: `adminuser@yopmail.com`
Password: `password`
