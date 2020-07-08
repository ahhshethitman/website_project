class WebsiteProject::Scraper 
 
  def self.best_places_to_work
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    
    results.each do |r| 
      name = r.css(".title").text
      ref = r.attr("value")
      WebsiteProject::Options.new(name, ref)
    end
  end
  
  def self.scrape_info(option)
    site = "https://www.builtinaustin.com/companies/best-places-to-work-austin-2020 = #{option.ref}"
    page = Nokogiri::HTML(open(site))
    
    results = page.css(".view-best-places-to-work .view-content .views-row")
    results.each do |i|
      info = i.css(".field-about-us").text 
      WebsiteProject::Info.new(info, option)
    end
  end
end 

