require 'httparty'
require 'nokogiri'
require 'csv'
require 'pry'

class ScrapeData

  def fuck_galla
    response = HTTParty.get("https://www.timesfreepress.com/news/sports/")

    doc = Nokogiri::HTML(response.body)      

    CSV.open("sports_articles.csv", "w") do |csv|
      csv << ["Title","Summary","Byline"]
      
      doc.css('.story_card').each do |card|
        headlines = card.at_css('.card_text .card__link')
        summaries = card.at_css('.card_text .card_tease')
        bylines = card.xpath('/html/body/div[1]/div/div[1]/section/ul/li[1]/article/div/div/text()').text.gsub(/\s+/, " ").strip
        csv << [headlines,summaries,bylines]
      end
    end
    
  end
end

ScrapeData.new.fuck_galla