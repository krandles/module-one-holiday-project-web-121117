require_relative '../config/environment'

@current_user = nil

cli = CommandLineInterface.new
cli.greet
