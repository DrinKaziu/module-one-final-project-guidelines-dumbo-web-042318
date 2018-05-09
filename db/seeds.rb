
drin = User.create(name: "Drin")
faraz = User.create(name: "Faraz")
john = User.create(name: "John")


basketball = Sport.create(name: "Basketball")
baseball = Sport.create(name: "Baseball")
soccer = Sport.create(name: "Soccer")
tennis = Sport.create(name: "Tennis")
football = Sport.create(name: "Football")


j_b_s = Subscription.create(name: "John's Basketball Subscription", user_id: john.id, sport_id: basketball.id)
j_s_s = Subscription.create(name: "John's Soccer Subscription", user_id: john.id, sport_id: soccer.id)

f_ba_s = Subscription.create(name: "Faraz's Baseball Subscription", user_id: faraz.id, sport_id: baseball.id)
f_t_s = Subscription.create(name: "Faraz's Tennis Subscription", user_id: faraz.id, sport_id: tennis.id)

d_s_s = Subscription.create(name: "Drin's Soccer Subscription", user_id: drin.id, sport_id: soccer.id)
d_f_s = Subscription.create(name: "Drin's Football Subscription", user_id: drin.id, sport_id: football.id)
