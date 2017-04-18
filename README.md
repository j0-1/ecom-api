# E-commerce API
This is a sample application for building a rails 5.0.2 api for an e-commerce domain.

## Setup
* Use ruby 2.3.4 (e.g. via [rvm]( http://rvm.io/))
* Install postgres for a database.  If you are on a mac  [postgres.app](https://postgresapp.com/) is very easy to use for this.
* Run `bin/setup` to create and setup the database for the app
* Run `bin/rspec` to verify the tests are all green.  `guard` is also installed in this app, so you can run `bin/guard` and then press enter to run all the specs.
* Import some sample products and inventory into the system (NOTE: be sure to load the products first, as the inventory references them):
  * `bin/rails import:products['spec/mock_files/products.csv']`
  * `bin/rails import:inventory['spec/mock_files/inventory.csv']`
* Run `bin/rails s` to start up the server
* See the inventory (with products and variants) `curl -v :3000/api/v1/inventory`

## UI
The source for the frontend UI is in this repo [ecom-ui](https://github.com/joestraitiff/ecom-ui).  I used Elm for this as I have been experimenting with it lately and have been enjoying it.

I've included the compiled version of the latest code in this project's public dir so that you can see the UI easily hosted by the rails server at `localhost:3000`

## Data Model
There are three models representing the data: Product, Image and Variant.

A `Product` has many images and has many variants.
An `Image` belongs to a product and has a url for the image (coming from a CDN).
A `Variant` belongs to a product and includes the inventory count for each specific variant of the product (i.e. style, size, etc.)

I expect that a `Product` will quickly want to have more than image for it, so created that relationship now.  However, for a `Variant` I left as a single object for now as it can be refactored in the future depending on how it's used (e.g. if inventory_count would be abstracted out for more complex inventory management)

## CSV files

The sample CSV files are included in the `specs/mock_files` directory as the tests use them to verify functionality.

The `products.csv` has some invalid formatting (i.e. the spaces after a comma and before the quoting per [rfc4180](https://tools.ietf.org/html/rfc4180)) that I've cleaned up with a gsub replacement.  If this were being used within a company, I would investigate the source of this file and fixup the export so that it was valid, especially if it was going to be imported more than once.

Also, because of this fixup, the csv is pulled into memory and then parsed.  If these file are going to be much larger in the future, this should be modified to consume the files one row at a time.

## Future work
Given more time and/or resources there are several improvements that can be done to this codebase:
* Authentication is noticeably missing, there are several approaches to this with probably the most straight-forward being to add Token based authentication.  E.g. user object with an API key that is authenticated via `authenticate_or_request_with_http_token`.  There are several other approaches that can be used (e.g. sessions, using cookies instead of the header based authentication, oauth, etc.)
* Authorization, once you have an authenticated user, you'll probably have different levels of users and need authorization.  Integrating [pundit](https://github.com/elabs/pundit) is a clean solution for this, but certainly not the only one.
* Throttling, when this is in the wild, you'd need to worry about excessive use.  That's when something like [rack-attack](https://github.com/kickstarter/rack-attack) comes in handy.
* If this is going to be added to for any length of time, especially in a team environment, I like to use [Good Migrations](https://github.com/testdouble/good-migrations) to help keep migrations under control. Good migrations will keep rails from auto-loading app code when running migrations prodding you to keep your migrations more future-proof.
* When going to deploy, the environment will determine how you might need to tweak CORS to work for the UI to access the server properly.  Currently [rack-cors](https://github.com/cyu/rack-cors) is enabled in the project in development mode and configured to be wide open to help with the UI running on a separate development server than the api code.  This allows all the niceties in modern UI development to be enabled while developing (e.g. auto-reloading, auto-testing, debug additions, etc.).  So production should be clamped down w.r.t. CORS and depending on how it's deployed could be disallowed altogether.
* Pagination, when more products are added to the system pagination will be necessary to keep resource usage reasonable.  Specifically, the api will need to return paginated results and the UI will need to query pages and handle next/prev links from the api.
