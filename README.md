# ruby_test
## Task description
- Ruby script receives log file as an argument
- Parses log file
- Returns parsed data ordered by page views count
- And data ordered by unique views count

## How to install:

```bash
bundle install
```

## How to run app:

Inside project folder run

```bash
ruby lib/parser.rb path_to_log_file
```

## How to run specs

Just run rspec command inside project folder
```bash
rspec
```

### Additionally you can run code quality tools using

```bash
rubocop
reek
```

## Approach description
The main points of used approach are:
- Validators check the file existence/file extension/file content present
- File parser collects data from file and converts it into array of log entries
- Statistics collector transform raw log entries into structure contains statistic data 
- Statistics formatter responsible for formatting and ordering the result set of data

## Possible improvements

- Error handling
- Think of another entry point to run the program, not internal file from lib
- More testing
- Rspec file includes improvements
- Improve how displaying information works
- Add CI check
