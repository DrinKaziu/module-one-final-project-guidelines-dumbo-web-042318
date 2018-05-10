require 'pry'

class CommandLineInterface
  def greet
    puts "Welcome to our app! Sports are great!"
  end

  def create_account
    puts "What would you like your username to be?"
    new_user = gets.chomp
    new_user_account = User.create(name: new_user)

    puts "Welcome new user! What's your favorite sport?"
    sport = gets.chomp
    sport_found = Sport.find_by(name: sport)

    if sport_found != nil
      new_sub = Subscription.create(name: "#{new_user_account.name}'s #{sport_found.name} subscription", sport_id: sport_found.id, user_id: new_user_account.id)
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
       #Add feature that shows subscription info
       user_name = User.find_by(name: name)
       user_name.sports.each do |x|
         puts x.name
       end
     else
       puts "We don't have an account under that name, yet. Please create one now."
       create_account
       # new_user = User.create(name: name)
       # new_user.favorite_sport
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
