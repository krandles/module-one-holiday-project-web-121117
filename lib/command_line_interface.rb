class CommandLineInterface
  def greet
    puts "Welcome to Rate My Beer!"
    puts "Enter your username to log in, or type \"new\" to create a new user account."
    input = gets.chomp.downcase
    greet_selection(input)
  end

  def greet_selection(input)
    if input == "new"
      create_new_user
    end
  end

  def login

  end

  def create_new_user
    puts "Please enter your name to create a new user account:"
    input = gets.chomp.capitalize
    if input.length == 0
      create_new_user
    else
      @current_user = User.create(name: input)
      main_menu
    end
  end

    def main_menu
      puts "main menu options go here"
    end
end