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
    puts "Hi, #{@current_user.name}. Please select an option to continue, or"
    puts "enter 'exit' to exit Tapped or 'logout' to log out of your account at any time."
    puts "1. Breweries"
    puts "2. Beers"
    puts "3. My Reviews"
    input = gets.chomp.downcase
    main_menu_selection(input)
  end

  def main_menu_selection(input)
    case input
    when '1', 'breweries' then breweries_menu
    when '2', 'beers' then beers_menu
    when '3', 'reviews', 'my reviews' then reviews_menu
    when 'exit' then goodbye
    when 'logout' then logout
    end
  end

  def breweries_menu
    puts "brewery selection goes here"
  end

  def beers_menu
    puts "beers selection goes here"
  end

  def reviews_menu
    puts "reviews menu goes here"
  end

  def return_to_main
    @current_brewery = nil
    @current_review = nil
    @current_style = nil
    @current_beer = nil
    main_menu
  end

  def logout
    puts "Thank you for using Tapped #{@current_user.name}, you will now be logged out.\n\n"
    @current_user = nil
    @current_brewery = nil
    @current_review = nil
    @current_style = nil
    @current_beer = nil
    greet
  end

  def goodbye
    puts "Thank you for using Tapped, goodbye!"
  end
end
