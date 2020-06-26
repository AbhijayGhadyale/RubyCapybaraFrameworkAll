# RubyCapybaraBDDFramework

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'RubyCapybaraBDDFramework'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install RubyCapybaraBDDFramework

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/RubyCapybaraBDDFramework. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/RubyCapybaraBDDFramework/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyCapybaraBDDFramework project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/RubyCapybaraBDDFramework/blob/master/CODE_OF_CONDUCT.md).

=========################================
ridk.cmd install 1 2 3
gem install bundler
gem install bundle


bundle exec cucumber --format html --out html-report/testReport.html

bundle exec cucumber --format json --out json-report/testReport.json

```

This will install Ruby, and the DevKit into `c:\tools` using Chocolatey. Ruby should also be accessible from the PATH. you can verify this via the following command:

```
ruby --version
```
If all went well, you should see the following string:
```
ruby 2.4.1p111 (2017-03-22 revision 58053) [x64-mingw32]
```

Then, from the root folder of the automation (eg c:\Code\mock-survey-web\automation) run the following 
    * `gem install bundle`
    * `bundle install`

This will download all the gems to run the automation.

Before running automation make sure you serve it with 
```
npm run serve-auto
```

#Setup

ensure the compliance service port is set to <strong>1234</strong> during testing

# Running from the commandline

Issue this command: `bundle exec cucumber`

# Writing / Debugging the automation:

Inside of RubyMine/IntelliJ 
- Search for the Ruby plugin and install it. (File -> Settings -> Plugins)
- Open the project structure and go to Project Settings -> Project. Point the Project SDK to the ruby install.
- Point the Ruby plugin to the folder for the Ruby installation (the Ruby 2.4 x64 path from above)
- Create a definition to run the integration tests (Run -> Edit Configurations)
    - Make sure you run the Cucumber command from the Bundle folder (there is a tab for this option.)
