system 'rm Gemfile' if File.exist?('Gemfile')
File.write('Gemfile', <<-GEMFILE)
 source 'https://rubygems.org'
 gem 'minitest-reporters',       '1.1.9'
 gem 'byebug'
 gem 'pry_debug'
 gem 'pry-nav'
GEMFILE

system 'bundle install'

require 'bundler'
Bundler.setup(:default)

require 'minitest/autorun'
require 'logger'
require 'byebug'
require 'pry'
require 'pry_debug'

require './league_table.rb'
require './test_league_table.rb'
