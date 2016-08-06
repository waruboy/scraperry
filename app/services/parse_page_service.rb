require 'open-uri'

class ParsePageService
  def process!(page)
    @page = page
    @doc = Nokogiri::HTML(open(@page.url))

    save_headers!
    save_links!
    @page.status = "parsed"
    @page.save!
  end

  private
    def save_headers!
      heads = @doc.css('h1, h2, h3').sort.map do |header|
        if header.content.blank?
          header.remove
        else
          {tag: header.description.to_s[0..1], content: header.content.strip}
        end
      end
      heads.each {|h| Header.create(page:@page, tag: h[:tag], content: h[:content])}

    end

    def save_links!
      links = @doc.css('a')
      links_urls = links.map {|link| link.attribute('href').to_s}.uniq.sort
        .delete_if {|href| href.scan(URI.regexp).empty? }
      links_urls.each { |link| Link.create(url: link, page: @page) }
    end

end
