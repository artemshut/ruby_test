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

First add some permissions to script file
```bash
chmod a+x bin/process_file
```

Then run the script itself
```bash
bin/process_file path_to_log_file
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
- More testing
- Rspec file includes improvements
- ~~Think of another entry point to run the program, not internal file from lib~~
- ~~Improve how displaying information works~~
- Add CI check
