User.destroy_all
Fact.destroy_all

user = User.create(name: "bodybuilder")

fact = Fact.create(fact: "Smaller breeds mature faster than larger breeds.")

user_facts = Favorite.create(user_id: user.id, fact_id: fact.id)

user.facts << fact