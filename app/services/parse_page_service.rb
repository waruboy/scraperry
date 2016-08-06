require 'open-uri'

class ParsePageService
  def process!
    doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))

    # puts "### h1 on page"
    # headers1 = doc.css('h1').map do |node|
    #   if node.content.blank?
    #     node.remove
    #   else
    #     node.content = node.content.strip
    #   end
    # end
    # headers1.uniq.each { |header| puts header }

    puts "### Links url on page"
    heads = doc.css('h1, h2, h3').sort.map do |header|
      if header.content.blank?
        header.remove
      else
        header.content.strip
      end
    end
    puts heads.uniq
    puts
    puts

    puts "### Links url on page"
    links = doc.css('a')
    links_urls = links.map {|link| link.attribute('href').to_s}.uniq.sort
      .delete_if {|href| href.scan(URI.regexp).empty? }
    puts links_urls

  end
end
