class CommandLineInterface
  def greet
    puts "Welcome to Tapped, your mom's favorite beer reviews database!"
    puts "Enter your username to log in, or 'new' to create a new user account."
    input = gets.chomp.downcase
    greet_selection(input)
  end

  def greet_selection(input)
    if input == 'new' then create_new_user
    elsif input == 'exit' then goodbye
    elsif User.find_by name: input.capitalize
      select_or_create_user(input)
    else
      create_new_user_prompt(input)
    end
  end

  def create_new_user_prompt(name)
    puts 'Username not found, would you like to create a new account? (y/n)'
    choice = gets.chomp
    if choice == 'y'
      create_new_user(name)
    else
      greet
    end
  end

  def create_new_user(name = nil)
    if !name
      puts 'Please enter your name to create a new user account:'
      new_name = gets.chomp.capitalize
    else new_name = name
    end
    if new_name.empty? then create_new_user
    else select_or_create_user(new_name)
    end
  end

  def select_or_create_user(name)
    @current_user = User.find_or_create_by name: name.capitalize
    main_menu
  end

  def main_menu
    puts "Hi, #{@current_user.name}. Please make a selection to continue, or"
    puts "enter 'exit' to exit Tapped or 'logout' to log out of your account."
    puts "1. Breweries"
    puts "2. Beers"
    puts "3. My Reviews"
    input = gets.chomp.downcase
    main_menu_selection(input)
  end

  def main_menu_selection(input)
    case input
    when '1', 'breweries' then breweries_selection_menu
    when '2', 'beers' then beers_menu
    when '3', 'reviews', 'my reviews' then reviews_menu
    when 'exit' then goodbye
    when 'logout' then logout
    end
  end

  def breweries_selection_menu
    puts "Currently tracking #{Brewery.all.count} breweries and #{Beer.all.count} beers."
    puts "Enter a brewery name, 'list' to see all breweries, or 'new' to add a new brewery."
    input = gets.chomp.downcase
    breweries_selection(input)
  end

  def breweries_selection(input)
    case input
    when "list" then list_breweries
    when "new" then add_brewery
    when "exit" then goodbye
    when "logout" then logout
    else select_or_create_brewery(input)
    end
  end

  def list_breweries
    Brewery.list
    puts "Enter the ID number of the brewery for more info and options."
    input = gets.chomp
    # TODO: error handling for invalid input
    if Brewery.find(input)
      @current_brewery = Brewery.find(input)
    else
      puts "Invalid input"
      brewery_selection_menu
    end
    brewery_menu
  end

  def add_brewery
    puts "Please enter the brewery name:"
    name = gets.chomp
    puts "Please enter the brewery location (City, ST):"
    location = gets.chomp
    @current_brewery = Brewery.create(name: name, location: location)
    puts "Thanks, your new brewery has been saved"
    brewery_menu
  end

  def brewery_menu
    puts "#{@current_brewery.name}, #{@current_brewery.location}"
    puts "Tracking #{@current_brewery.beers.all.count} beers with an average rating of #{@current_brewery.average_score} and average ABV of #{@current_brewery.average_abv}."
    puts "Please make a selection to continue, enter 'exit'"
    puts "to exit Tapped, or 'logout' to log out of your account."
    puts "1. List all beers"
    puts "2. List all reviews"
    puts "3. List my reviews"
    puts "4. Add a new beer"
    brewery_menu_selection
  end

  def brewery_menu_selection
    input = gets.chomp.downcase
    case input
    when '1', 'beers', 'list all beers' then brewery_beers_list
    when '2', 'reviews', 'list all reviews' then brewery_reviews_list
    when '3', 'my reviews', 'list my reviews' then brewery_reviews_list(@current_user)
    when '4', 'add', 'add a new beer' then brewery_add_beer
    when 'exit' then goodbye
    when 'main' then return_to_main
    when 'logout' then logout
    end
  end

  def brewery_beers_list
    puts "ID  Name - Avg. Rating - ABV - Style"
    @current_brewery.beers.each do |beer|
      puts "#{beer.id}. #{beer.name} #{beer.average_score} #{beer.abv} #{beer.style.name}"
    end
    puts "\nSelect a beer by ID number to see reviews or enter 'back' to return to the brewery menu"
    input = gets.chomp
    if input == 'back' then brewery_menu
    else
      @current_beer = Beer.find(input)
      brewery_beer_reviews_list
    end
  end

  def brewery_beer_reviews_list
    @current_beer.reviews.each(&:print)
    puts "Would you like to add a new review for this beer? (y/n)"
    input = gets.chomp
    if input == "y"
      brewery_beer_new_review
    else
      @current_beer = nil
    end
    brewery_beers_list
  end

  def brewery_beer_new_review
    puts "Enter your score from 1-100:"
    score = gets.chomp
    puts "Enter any comments for this review:"
    comments = gets.chomp
    Review.create(user: @current_user, beer: @current_beer, date: Time.now, score: score, comments: comments)
    puts "Thanks, your review has been saved!\n\n"
    @current_beer = nil
    brewery_beers_list
  end

  def brewery_reviews_list(user = nil)
    if user.nil?
      @current_brewery.reviews.each(&:print)
    else
      @current_brewery.reviews.where(user: @current_user).find_each(&:print)
    end
    brewery_menu
  end

  def brewery_add_beer
    puts "Please enter the name of the beer:"
    name = gets.chomp
    puts "Please enter the ABV as a decimal number (e.g. 5.1):"
    abv = gets.chomp
    puts "Please select the beer's style by ID number from the following list:"
    Style.list
    input = gets.chomp
    style = Style.find(input)
    @current_beer = Beer.create(name: name, abv: abv, brewery: @current_brewery, style: style)
    puts "Thanks, your beer has been added, would you like to review this beer now? (y/n)"
    input = gets.chomp
    if input == "y"
      brewery_beer_new_review
    else
      @current_beer = nil
    end
    brewery_menu
  end

  def beers_menu
    puts "beers selection goes here"
  end

  def reviews_menu
    puts "reviews menu goes here"
  end

  def return_to_main
    user = current_user
    reset_global_variables
    @current_user = user
    main_menu
  end

  def logout
    puts "Thank you for using Tapped #{@current_user.name}, you will now be logged out.\n\n"
    reset_global_variables
    greet
  end

  def goodbye
    puts "Thank you for using Tapped, goodbye!"
  end

  def reset_global_variables
    @current_user = nil
    @current_brewery = nil
    @current_review = nil
    @current_style = nil
    @current_beer = nil
  end
end
