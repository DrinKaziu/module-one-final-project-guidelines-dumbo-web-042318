

#USERS
drin = User.create(name: "Drin")
faraz = User.create(name: "Faraz")
john = User.create(name: "John")

#SPORTS
basketball = Sport.create(name: "Basketball")
baseball = Sport.create(name: "Baseball")
soccer = Sport.create(name: "Soccer")
tennis = Sport.create(name: "Tennis")
football = Sport.create(name: "Football")


#SUBSCRIPTIONS
j_b_s = Subscription.create(name: "John's Basketball Subscription", user_id: john.id, sport_id: basketball.id)
j_s_s = Subscription.create(name: "John's Soccer Subscription", user_id: john.id, sport_id: soccer.id)

f_ba_s = Subscription.create(name: "Faraz's Baseball Subscription", user_id: faraz.id, sport_id: baseball.id)
f_t_s = Subscription.create(name: "Faraz's Tennis Subscription", user_id: faraz.id, sport_id: tennis.id)

d_s_s = Subscription.create(name: "Drin's Soccer Subscription", user_id: drin.id, sport_id: soccer.id)
d_f_s = Subscription.create(name: "Drin's Football Subscription", user_id: drin.id, sport_id: football.id)


#CITIES
nyc = City.create(name: "New York City", state: "New York")
wsh = City.create(name: "Washington DC", state: "District of Columbia")
phi = City.create(name: "Philadelphia", state: "Pennsylvania")
pgh = City.create(name: "Pittsburgh", state: "Pennsylvania")



#TEAMS
mets = Team.create(name: "Mets", mascot: "Mr. Met", colors: "Blue, Orange", championships: 2, sport_id: baseball.id, city_id: nyc.id, info: "The Mets qualified to play in the Major League Baseball postseason in 2006, when they came within one game of the World Series, losing to the eventual champion St. Louis Cardinals in the NLCS.[7] The Mets missed the playoffs with losses on the last day of the regular season in 2007 and 2008.[8] The Mets made the playoffs in 2015 for the first time in nine years, and won their first NL pennant in 15 years.")



yanks = Team.create(name: "Yankees", mascot: "Dandy", colors: "Pinstripes", championships: 27, sport_id: baseball.id, city_id: nyc.id, info: "The New York Yankees are a major league baseball (MLB) team based in The Bronx, New York. They’re one of two of New York City’s MLB teams (the other being the New York Mets) and are one of the most successful sports teams in the world. They’ve won 27 World Series championships and 18 division titles – both records within the MLB.")

nats = Team.create(name: "Nationals", mascot: "Screech the Bold Eagle", colors: "Red, White, Blue", championships: 0, sport_id: baseball.id, city_id: wsh.id, info: "The Washington Nationals are a professional baseball team based in Washington, D.C. The Nationals compete in Major League Baseball as a member club of the National League East division.")

phils = Team.create(name: "Phillies", mascot: "The Philly Fanatic", colors: "Red, White", championships: 2, sport_id: baseball.id, city_id: phi.id, info: "The Phillies have won two World Series championships (against the Kansas City Royals in 1980 and the Tampa Bay Rays in 2008) and seven National League pennants, the first of which came in 1915. The franchise has also experienced long periods of struggle. Since the first modern World Series was played in 1903, the Phillies played 77 consecutive seasons (and 97 seasons from the club's establishment) before they won their first World Series—longer than any other of the 16 teams that made up the major leagues for the first half of the 20th century.")

pirates = Team.create(name: "Pirates", mascot: "The Pirate Parrot", colors: "Gold, Black", championships: 5, sport_id: baseball.id, city_id: pgh.id, info: "After a run of regular-season success in the early 1990s (winning three straight East Division titles), the Pirates struggled mightily over the following 20 years, with 20 consecutive losing seasons from 1993 to 2012—the longest such streak in North American professional sports history—before posting a winning record in 2013 of 94–68, qualifying them for the NL Wild Card.")
