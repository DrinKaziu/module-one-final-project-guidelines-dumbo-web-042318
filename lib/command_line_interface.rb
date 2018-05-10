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

  # def show_users_sports
  #   puts "Welcome back, here are your sports"
  #   #show user.sports
  # end

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
       # new_user = User.create(name: name)
       # new_user.favorite_sport
     end
   end

   def create_subscription
     puts "Which sport would you like to subscribe to?"

     sport_given = gets.chomp
     sport = Sport.find_by(name: sport_given)

     new_fav_sport = Subscription.create(name: sport_given, user_id: @user.id, sport_id: sport.id)
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
