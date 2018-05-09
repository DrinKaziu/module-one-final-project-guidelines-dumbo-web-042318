class CommandLineInterface
  def greet
    puts "Welcome to our app! Sports are great!"
  end

  def login
    puts "What's your first name?"
     name = gets.chomp
       if User.find_by(name: name) != nil
         puts "Welcome back, #{name}!"
       else
         new_user = User.create(name: name)
       end
     end

    def favorite_sport
      puts "What's your favorite sport?"
      sport = gets.chomp
        if Sport.find_by(name: sport) != nil
          new_sub = Subscription.create(name: sport)
        end



end
