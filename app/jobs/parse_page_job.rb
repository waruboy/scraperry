class ParsePageJob
  def perform(page_id)
    page = Page.find page_id
    ParsePageService.new.process!(page)
  end
end
