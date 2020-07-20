# RubyCapybaraBDDFramework

Go to Terminal with root folder/Parent Directory
Use command

$ bundle install
This will download all the gems to run the automation.


## Usage


## Development


## Contributing


# Running from the commandline
For Executing Test cases in form of feature file use below Commands

1)  to obtain cucumber html reports and exec test cases

'bundle exec cucumber --format html --out html-report/testReport.html'


2)  to obtain cucumber html reports and Report builder html reports and exec test cases

'bundle exec cucumber --format json --out json-report/testReport.json'


3) to only execute test cases 
'bundle exec cucumber'

# Writing / Debugging the automation:

Inside of RubyMine/IntelliJ 
- Search for the Ruby plugin and install it. (File -> Settings -> Plugins)
- Open the project structure and go to Project Settings -> Project. Point the Project SDK to the ruby install.
- Point the Ruby plugin to the folder for the Ruby installation (the Ruby 2.4 x64 path from above)
- Create a definition to run the integration tests (Run -> Edit Configurations)
    - Make sure you run the Cucumber command from the Bundle folder (there is a tab for this option.)
