require 'nokogiri'
require 'open-uri'
url = 'http://www.languagedaily.com/learn-german/vocabulary/common-german-words'
page = Nokogiri::HTML(open(url))

User.delete_all
Card.delete_all

user = User.create(email: 'bart@simpson.com')

# Find all links with words from Main Page
links = ["/learn-german/vocabulary/common-german-words"]
page.css('div .jsn-article-content ul li a').each do |link|
  links << link['href']
end

# Actually scrape
links.each do |link|
  set_url = "http://www.languagedaily.com/" + link
  set_page = Nokogiri::HTML(open(set_url))
  set_page.css('td.bigLetter').each do |line|
    original = line.text.downcase
    translated = line.next_element.text.downcase unless line.next_element.content.blank?
    unless Card.exists?(original_text: original)
      begin
        Card.create(original_text: original,
                    translated_text: translated,
                    user_id: user.id)
      rescue ActiveRecord::RecordInvalid
      end
    end
  end
end
