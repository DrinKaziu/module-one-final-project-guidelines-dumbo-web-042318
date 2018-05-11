require 'pry'

class CommandLineInterface
  def greet
    puts "\nWelcome to our app! Sports are great!\n\n"
  end

#Creates a new account and saves it to the DB
  def create_account
    puts "\nWhat would you like your username to be?"
    new_user = gets.chomp
    @user = User.create(name: new_user)

    puts "\nWelcome #{@user.name}! What's your favorite sport?"
    sport = gets.chomp
    sport_found = Sport.find_by(name: sport)

    if sport_found != nil
      new_sub = Subscription.create(name: "#{@user.name}'s #{sport_found.name} subscription", sport_id: sport_found.id, user_id: @user.id)
    else
      puts "\nSorry, but we don't currently support subscriptions for #{sport}."
    end
  end

#Login for existing user
  def login
    puts "\nWhat is the name on your account?"
    name = gets.chomp
     if User.find_by(name: name) != nil
       puts "\nWelcome back, #{name}!"

       @user = User.find_by(name: name)
       puts "\nYou are currently suscribed to:"
       @user.sports.each{|x| puts x.name}

     else
       puts "\nWe don't have an account under that name, yet. Please create one now."
       create_account
     end
   end

#Creates a new subscription fro current user
   def create_subscription
     puts "\nWhich sport would you like to subscribe to?"

     sport_given = gets.chomp
     sport = Sport.find_by(name: sport_given)

     if sport != nil
       new_sub = Subscription.create(name: "#{@user.name}'s #{sport.name} subscription", sport_id: sport.id, user_id: @user.id)
     else
       puts "\nSorry, but we don't currently support subscriptions for #{sport_given}."
     end
   end

#Deletes subscription for current user
   def delete_subscription
     puts "\nWhich subscription would you like to delete?"
      sport_given = gets.chomp

      sport = Sport.find_by(name: sport_given)
      subs = @user.subscriptions.find_by(user_id: @user.id, sport_id: sport.id)

      subs.destroy

      puts "\nYou just deleted your #{sport.name} subscription."
   end

#Shows the Current users subscription
   def show_subscriptions
     puts "\nYour current subscriptions are:"
     @user.subscriptions.reload.each do |sub|
       puts sub.name
     end
   end

  def menu_prompt
    puts "\nWhat would you like to do next?\n1.) Follow a sport\n2.) Remove a sport\n3.) Show all the sports you follow\n4.) Show sports teams\n5.) Sign out"
  end
#Menu function that controls our CLI
   def menu
     puts "\nPlease pick an option from the choices below:\n1.) Follow a sport\n2.) Remove a sport\n3.) Show all the sports you follow\n4.) Show sports teams\n5.) Sign out"
     answer = gets.chomp
     while answer != "sign out" || answer == "4"
       if answer == "1"
         create_subscription
         menu_prompt
         answer = gets.chomp
         #do we need to update the database now?
       elsif answer == "2"
         delete_subscription
         menu_prompt
         answer = gets.chomp
       elsif answer == "3"
          show_subscriptions
          menu_prompt
          answer = gets.chomp
       elsif answer == "4"
          show_teams
          puts "\nWould you like to see more info on any specific team? (Answer y for yes or n for no)"
          reply = gets.chomp

          if reply == "yes" || reply == "y"
            show_team_info
          end

          menu_prompt
          answer = gets.chomp
       elsif answer == "5"
           puts "\nThanks for stopping by. See you soon!"
           break
       else
         puts "\nThat is not a valid response, smart guy!"
          menu_prompt
          answer = gets.chomp
       end
     end
   end

#Shows all the teams for a specific sport
   def show_teams
     puts "\nWhat sport would you like to see the teams for? (Enter a sport please)"
     sport_name = gets.chomp

     @sport = Sport.find_by(name: sport_name)

     puts "\nHere is a list of the teams for #{sport_name}"
     @sport.teams.each do |x|
       puts "\n#{x.name} - #{x.city.name}\n"
       # puts x.info
     end
   end

#Prints nicely, all the info about a specific team
   def show_team_info
     puts "\nEnter a team name please?"
     answer = gets.chomp

     team = @sport.teams.find_by(name: answer)

     puts "\n NAME: #{team.name}\n\n CITY: #{team.city.name}\n\n MASCOT: #{team.mascot}\n\n COLORS: #{team.colors}\n\n CHAMPIONSHIPS: #{team.championships}\n\n DESCRIPTION: #{team.info}\n\n"
   end

end
