class WebsiteProject::Company
  attr_accessor :name,:key_info,:key_benefits,:specific_benefits,:id,:ref
  
  @@all = []
  
  
  def initialize(name,ref)
    @name = name
    @ref = ref
    @key_benefits = []
    @specific_benefits = []
    assign_id
    save 
  end
  
  def save 
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def assign_id
    @id = @@all.size + 1
  end
  
  def self.exists?(idx) #idx is relative to @input
    (1..all.length).include?(idx.to_i)
  end
  
  def self.prepare_to_list
    WebsiteProject::Scraper.best_places_to_work if all.empty? #if @@all is empty then scrape
  end
  
  def self.find_by_id(input)
    all.find{|c| c.id == input.to_i}
  end
  
  def get_info
    WebsiteProject::Scraper.scrape_company_info(self) unless @key_info #self is giving info for every company instead of by selected ID
  end
  
end


