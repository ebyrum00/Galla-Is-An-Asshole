require_relative 'scraper'

class TerminalInterface

  puts "Loading NewsScraper9000™..."

  sleep 1.0

  puts "Whatchu wanna read bout gang?"
  puts "1. Sports"
  puts "2. Politics"
  puts "3. Local News"

  topic_selection = gets.chomp.strip.to_i - 1

  scrape_articles = ScrapeData.new(topic_selection).article_index
end