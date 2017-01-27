desc 'get words from URL'
task scrape: :environment do
  require 'nokogiri'
  require 'open-uri'
  url = 'http://www.languagedaily.com/learn-german/vocabulary/common-german-words'
  page = Nokogiri::HTML(open(url))

  # Find all links with words from Main Page
  links = ["/learn-german/vocabulary/common-german-words"]
  page.css('div .jsn-article-content ul li a').each do |link|
    links << link['href']
  end

  # Actually scrape
  count = links.size
  count.times do |i|
    set_url = "http://www.languagedaily.com/" + links[i]
    set_page = Nokogiri::HTML(open(set_url))
    set_page.css('td.bigLetter').each do |line|
      puts "#{line.text} - #{line.next_element.text}" unless line.next_element.content.blank?
    end
  end
end
