require 'capybara'
require 'capybara/cucumber'
require 'webdrivers'
require 'selenium-webdriver'
require 'yaml'
require 'capybara-screenshot'
require 'rspec'
require 'capybara/dsl'
require 'rspec/core'
require 'rspec/expectations'
require 'logger'
require 'capybara-screenshot/cucumber'


module AutomationContext
  class << self
    attr_accessor :app_host, :local_run

    def startup(config_file)
      unless File.exist?(config_file)
        raise "Could not locate automation config file: #{config_file}"
      end

      test_config = YAML::load_file(config_file)

      case test_config['selenium']['browser']
      when 'chrome'
        self.bootstrap_chrome
      when 'firefox'
        self.bootstrap_ff
      when 'ie'
        self.bootstrap_ie
      when 'chrome-headless'
        self.bootstrap_chrome_headless
      when 'firefox-headless'
        self.bootstrap_ff_headless
      else
        -1
      end

      Capybara.configure do |run_config|
        run_config.run_server = false
        run_config.default_driver = :remote_browser
        run_config.javascript_driver = :remote_browser
        run_config.app_host = test_config['test']['app_host']
        run_config.default_max_wait_time = 5
        run_config.save_path = './FailedSnapshots'
        printf "Testing against app host: %s\n", run_config.app_host
      end
    end




    Capybara::Screenshot.autosave_on_failure = true
    Capybara::Screenshot.register_driver(:remote_browser) do |driver, path|
      driver.browser.save_screenshot(path)
    end

    def bootstrap_chrome
      Capybara.register_driver :remote_browser do |app|
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end
      Capybara.default_driver = :remote_browser
    end


    def bootstrap_chrome_headless
      Capybara.register_driver :remote_browser do |app|
        options = Selenium::WebDriver::Chrome::Options.new(args: %w[--headless])
        Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
      end
      Capybara.default_driver = :remote_browser
    end


    def bootstrap_ff
      Capybara.register_driver :remote_browser do |app|
        options = {
            :js_errors => false,
        }
        options = Selenium::WebDriver::Firefox::Options.new
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
            acceptInsecureCerts: true,
        )
        Capybara::Selenium::Driver.new(
            app,
            browser: :firefox,
            options: options,
            desired_capabilities: capabilities
        )
      end
      Capybara.default_driver = :remote_browser
    end


    def bootstrap_ff_headless
      Capybara.register_driver :remote_browser do |app|
        options = {
            :js_errors => false,
        }
        options = Selenium::WebDriver::Firefox::Options.new(args: %w[--headless])
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
            acceptInsecureCerts: true,
        )
        Capybara::Selenium::Driver.new(
            app,
            browser: :firefox,
            options: options,
            desired_capabilities: capabilities
        )
      end
      Capybara.default_driver = :remote_browser
    end


    def bootstrap_ie
      Capybara.register_driver :remote_browser do |app|
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.read_timeout = 60

        capabilities = Selenium::WebDriver::Remote::Capabilities.internet_explorer
        capabilities['ignoreProtectedModeSettings'] = true,
            capabilities['ignoreZoomSetting'] = true,
            capabilities['nativeEvents'] = true,
            capabilities['requireWindowFocus'] = true

        Capybara::Selenium::Driver.new(app, browser: :internet_explorer,
                                       desired_capabilities: capabilities, http_client: client)

      end
      Capybara.default_driver = :remote_browser
    end


  end
end





