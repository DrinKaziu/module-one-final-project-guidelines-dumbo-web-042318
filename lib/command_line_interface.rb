require 'pry'

class CommandLineInterface
  def greet
    puts "Welcome to our app! Sports are great!"
  end

  def create_account
    puts "What would you like your username to be?"
    new_user = gets.chomp
    @user = User.create(name: new_user)

    puts "Welcome #{@user.name}! What's your favorite sport?"
    sport = gets.chomp
    sport_found = Sport.find_by(name: sport)

    if sport_found != nil
      new_sub = Subscription.create(name: "#{@user.name}'s #{sport_found.name} subscription", sport_id: sport_found.id, user_id: @user.id)
      # binding.pry
    else
      puts "Sorry, but we don't currently support subscriptions for #{sport}."
      # Maybe add functionality here to tell user all the sports we do offer.
    end
  end

  def login
    puts "What is the name on your account?"
    name = gets.chomp
     if User.find_by(name: name) != nil
       puts "Welcome back, #{name}!"

       @user = User.find_by(name: name)

       @user.sports.each{|x| puts x.name}

     else
       puts "We don't have an account under that name, yet. Please create one now."
       create_account
     end
   end

   def create_subscription
     puts "Which sport would you like to subscribe to?"

     sport_given = gets.chomp
     sport = Sport.find_by(name: sport_given)
     #^^^^^We should have a method for this^^^^

     # new_fav_sport = Subscription.create(name: sport_given, user_id: @user.id, sport_id: sport.id)

     if sport != nil
       new_sub = Subscription.create(name: "#{@user.name}'s #{sport.name} subscription", sport_id: sport.id, user_id: @user.id)
       # binding.pry
     else
       puts "Sorry, but we don't currently support subscriptions for #{sport_given}."
       # Maybe add functionality here to tell user all the sports we do offer.
     end
   end

   def more_info

   end

   def delete_subscription
     puts "Which subscription would you like to delete?"
      sport_given = gets.chomp
      # binding.pry
      sport = Sport.find_by(name: sport_given)
      subs = @user.subscriptions.find_by(user_id: @user.id, sport_id: sport.id)

      # binding.pry

      subs.destroy
      # @user.update
      puts "You just deleted your #{sport.name} subscription."
   end

   def show_subscriptions
     puts "Your current subscriptions are:"
     @user.subscriptions.reload.each do |sub|
       puts sub.name
     end
   end

   def menu
     puts "Choose one option:\n 1) follow a sport\n 2) remove a sport\n 3) show all the sports you follow\n 4) sign out"
     answer = gets.chomp
     while answer != "sign out" || answer == "4"
       if answer == "1"
         create_subscription
         puts "What would you like to do next?\n 1) follow a sport\n 2) remove a sport\n 3) show all the sports you follow\n 4) sign out"
         answer = gets.chomp
         #do we need to update the database now?
       elsif answer == "2"
         delete_subscription
         puts "What would you like to do next?\n 1) follow a sport\n 2) remove a sport\n 3) show all the sports you follow\n 4) sign out"
         answer = gets.chomp
       elsif answer == "3"
          show_subscriptions
          puts "What would you like to do next?\n 1) follow a sport\n 2) remove a sport\n 3) show all the sports you follow\n 4) sign out"
          answer = gets.chomp
        elsif answer == "4"
          puts "Thanks for stopping bye. See you soon!"
          break
        else
          puts "Please enter a valid number from options above. \n 1) follow a sport\n 2) remove a sport\n 3) show all the sports you follow\n 4) sign out"
          answer = gets.chomp
        end
      end
    end
end



  # def favorite_sport
  #   puts "What's your favorite sport?"
  #   sport = gets.chomp
  #   # binding.pry
  #   sport_found = Sport.find_by(name: sport)
  #   # binding.pry
  #
  #   if sport_found != nil
  #     new_sub = Subscription.create(name: "#{self.name}'s #{sport_found.name} subscription", sport_id: sport_found.id, user_id: self.id)
  #     # binding.pry
  #   else
  #     puts "Sorry, but we don't currently support subscriptions for #{sport}."
  #     # Maybe add functionality here to tell user all the sports we do offer.
  #   end
  # end
