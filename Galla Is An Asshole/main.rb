require 'httparty'
require 'nokogiri'
require 'csv'

class ScrapeData

  def fuck_galla
    response = HTTParty.get("https://www.timesfreepress.com/news/sports/")

    doc = Nokogiri::HTML(response.body)      

    headlines = doc.css('section.news_subsection .story_card a')
    CSV.open("sports_articles.csv", "w") do |csv|
      headlines.each do |title|
        csv << [title]
      end
    end
    
  end
end

ScrapeData.new.fuck_galla