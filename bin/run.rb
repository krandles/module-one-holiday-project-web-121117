require_relative '../config/environment'

@current_user = nil
@current_beer = nil
@current_brewery = nil
@current_review = nil
@current_style = nil

# comment out the next line to re-enable SQL logging
ActiveRecord::Base.logger.level = 1

cli = CommandLineInterface.new
cli.greet
