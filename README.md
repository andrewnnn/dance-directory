# Dance Directory

### Summary
Dance Directory a simple CRUD app I made for fun to rediscover the magic of the Ruby on Rails framework (used it ages ago in 2016 @ uni)

It is a website displaying various dance studios around Australia, a short description and also what styles they offer. It also allows users to add reviews and their rating out of 5 stars.

### Features:
- Search
- Auth (later disabled due to issues)
- Rating and reviews 

### Notes:
- bootstrap 5 for styling
- used a bootstrap template
- devise for auth which was commented out

### Dependencies:
- postgres

### Run Instructions:
1. Install gem dependencies: `ruby bin/bundle install`
2. Setup postgres DB (create dbs with appropriate user priviledges) refer to database.yml
3. Run migrations: `ruby bin/rails db:migrate`
4. Seed database: `ruby bin/rails db:seed`
5. Run server: `ruby bin/rails server`
