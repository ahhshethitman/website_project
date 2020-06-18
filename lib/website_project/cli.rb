class WebsiteProject::CLI 

  def call 
    puts "\nWelcome!\n"
    get_options
    print_options
    get_user_selection
  end 
  
  def get_options
   @user_options = WebsiteProject::Options.all
  end
  
  def print_options
    puts "Please make a selection"
    @user_options.each.with_index(1) do |option, index| 
    puts "#{index}. #{option.name}"
   end
  end 
  
  def get_user_selection
    input = gets.strip.to_i
    list_selected_companies(input) if valid_input(input, @user_options) #calls on method if valid 
  end 
    
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def list_selected_companies(input) #method should print selection
    options = @user_options [input - 1]
    puts "Here are the #{options}"
    ##to implement
    #WebsiteProject::Website.all.each.with_index(1) do |website|
      #puts website.name
    #end 
    #get_user_selection
  end 
end





