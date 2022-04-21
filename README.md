# Mutant Detection Api

This project analizes DNA pattern of humans and detects if human have a mutant DNA pattern.

## Requirements
This app was developed with the following characteristics:

* Ruby version
  2.7.5

* Rails version
  7.0.2.3

## Setup

1. Run bundler to install project dependencies.

1. Create `config/database.yml` based on `config/database.yml.example` to match your local settings.

1. Create database.

    ```sh
    $ rake db:create
    ```

1. Load db schema.

    ```sh
    $ rake db:schema:load
    ```

* How to run the app
  run local host with rails server
  run local network with rails server -d ip_network -p Port
  example: rails server -b 192.168.1.2 -p 3000

## Testing

The application uses rspec for testing.

To run all tests use the following command.

```sh
$ rspec
```

To run a specific file of tests use the following command.

```sh
$ rspec path/to/file_spec.rb
```

To run a specific test in a file use the following command. Change the number to the line of the first line of the test block.

```sh
$ rspec path/to/file_spec.rb:15
```

* Configuration
  The api require heads for the access to routes:
  Accept application/vnd.mutants-api.v1+json
  Content-Type application/json
  Authorization token

