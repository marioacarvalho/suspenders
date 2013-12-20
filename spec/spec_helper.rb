ENV['RACK_ENV'] = 'test'
TEST = true
require 'bundler/setup'
require File.expand_path(File.join('..', 'lib', 'suspenders', 'generators', 'app_generator'), File.dirname(__FILE__))
require File.expand_path(File.join('..', 'lib', 'suspenders', 'actions'), File.dirname(__FILE__))
require File.expand_path(File.join('..', 'lib', 'suspenders', 'app_builder'), File.dirname(__FILE__))

templates_root = File.expand_path(File.join("..", "templates"), File.dirname(__FILE__))
Suspenders::AppGenerator.source_root templates_root
Suspenders::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root << templates_root


Bundler.require(:default, :development)

Dir['./spec/support/**/*.rb'].each { |file| require file }
