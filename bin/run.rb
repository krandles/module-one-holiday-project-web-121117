require_relative '../config/environment'

@current_user = nil
@current_beer = nil
@current_brewery = nil
@current_review = nil
@current_style = nil

cli = CommandLineInterface.new
cli.greet
