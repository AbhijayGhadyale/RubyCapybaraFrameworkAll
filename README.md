# RubyCapybaraBDDFramework
# Initial setup for Ruby Automation

## Install Ruby and the Dev Kit
•	Ruby Dev Kit should be installed on the system 

•	This framework is developed on Ruby version ruby 2.4.1p111 (2017-03-22 revision 58053) [x64-mingw32] 

•	Download the latest version of Ruby Dev Kit and Install it on system. Refer below link:  
<https://rubyinstaller.org/downloads/>

-- OR -- 
 
   Go to Powershell in admin mode in Windows machine and use below commands to install ruby and ruby dev kit 
   
   $ choco install ruby
   
   $ choco install ruby2.devkit
   
   $ choco upgrade ruby2.devkit --y

   $ refreshenv
   

•	After installing Ruby Dev kit go to cmd and check Ruby version using command

  $ruby --version 

•	Go to terminal and use command

  $ridk.cmd install 1 2 3

•	Ensure System Environment variables are updated in class path for Ruby

•	Install Bundler which will manage all of Ruby dependencies using command in cmd

$gem install bundler

and at end use command in cmd  

$gem install bundle

•	An IDE which supports Ruby programming viz Ruby Mine IDE, Intellij IDE with Ruby Plugin Support, Visual Studio code with Ruby Plugins 

•	Once the code has been checked out from the git repo, install required gems by command 

Go to Terminal with root folder/Parent Directory
Use command

$ bundle install

This will download all the gems to run the automation.


## Usage
Using this web automation can be implemented and test cases can be executed on browsers like 
chrome,ie and firefox 

It supports headless mode for chrome and firefox browsers


## Development
For development Ruby Language is used and capybara with selenium webdriver to do 
UI operations on browser 

Rspec is used for verification 

Cucumber used provides support for BDD test cases



## Contributing
Contact for contributing to fixes and patches or enhancing the utility:                                                            	
Abhijay Ghadyale – abhijay.ghadyale@citiustech.com 


# Running from the commandline
For Executing Test cases in form of feature file use below Commands

1)  to obtain cucumber html reports and exec test cases

'bundle exec cucumber --format html --out html-report/testReport.html'

2)  to obtain cucumber html reports and Report builder html reports and exec test cases

'bundle exec cucumber --format json --out json-report/testReport.json'

3) to only execute test cases (all)

'bundle exec cucumber'


# Writing / Debugging the automation:

Inside of RubyMine/IntelliJ 
- Search for the Ruby plugin and install it. (File -> Settings -> Plugins)
- Open the project structure and go to Project Settings -> Project. Point the Project SDK to the ruby install.
- Point the Ruby plugin to the folder for the Ruby installation (the Ruby 2.4 x64 path from above)
- Create a definition to run the integration tests (Run -> Edit Configurations)
    - Make sure you run the Cucumber command from the Bundle folder (there is a tab for this option.)
