class WebsiteProject::CLI 

  def call 
    puts "\nWelcome! Here are the top 100 companies in the Austin area.\n"
    while @input != 'bye'
      get_options
      print_options
      get_user_selection
      valid_input ? list_info : show_error
      get_next_step
    end 
    goodbye
  end 
  
  
  
 
  def print_options
    puts "Loading companies.."
    WebsiteProject::Company.prepare_to_list
    JsScrapingDemo::Movie.all.each{|m| puts "#{m.id}: #{m.name}"}
    puts "Please make a selection for more info.."
  end 
  
  def get_user_selection
    input = gets.strip.to_i
  end 
    
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def show_error
    puts "#{@@muted}Sorry that's not a valid input! Please try again!#{@@white}"
  end
  
  def show_movie
    puts "\n#{@@mag}Loading your chosen movie ...#{@@white}"
    movie = JsScrapingDemo::Movie.find_by_id(@input)
    movie.get_details
    puts "\n#{movie.description}"
    puts "\nRotten Tomatoes rating:\t#{movie.rt_rating}\t|\tAudience rating:\t#{movie.aud_rating}"
  end
  
  def list_info(input) 
    Puts "Loading your chosen company..."
    company = WebsiteProject::Company.get_info(@input)
    puts "Here is info for #{option.name}" #output message for selected company
    option.info.each.with_index(1) do |info, idx|
      puts "#{idx}. #{option.info}"
    end
  end 
  
  def get_next_step
    puts "\n#{@@cyn}To see listing again type #{@@blu}'list'#{@@cyn} or say #{@@blu}'bye'#{@@cyn} to exit#{@@white}"
    get_user_input
  end
  
  def goodbye
    puts "Have a wonderful day!"
  end
end


  





