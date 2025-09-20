require 'httparty'
require 'nokogiri'
require 'csv'
require 'pry'
require_relative "cli"


BASE_URL = "https://www.timesfreepress.com/news"

load_ui = TerminalInterface.new

=begin

ruby main.rb


Loading....


Articles:


select an article or press N for next page. 

if youre on 2 then it should allow you to press P 


Scraper Class
Atricle Class
CLI Class

SRP

=end