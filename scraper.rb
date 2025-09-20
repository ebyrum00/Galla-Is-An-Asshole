class ScrapeData

  BASE_URL = "https://www.timesfreepress.com/news"

  def initialize(topic)
    @topic_selection = topic
    @slugs = ["/sports","/politics","/local"]
  end

  def article_index
    articles = []
    selected_topic = @slugs[@topic_selection]
    topic_url = HTTParty.get(BASE_URL + selected_topic)
    doc = Nokogiri::HTML(topic_url.body)

    doc.css('.story_card').each_with_index do |card,index|
      index = index + 1
      headline = card.at_css('.card_text .card__link').text
      summary = card.at_css('.card_text .card_tease').text
      byline = card.xpath("/html/body/div[1]/div/div[1]/section/ul/li[#{index}]/article/div/div/text()").text.gsub(/\s+/, " ").strip
      url_element = card.css('.card_text .card__link').attr("href")
      url = BASE_URL + url_element.value
      articles << {headline: headline, summary: summary, byline: byline, url: url}
    end
    puts articles
  end
end