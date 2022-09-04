class App 
    attr_reader :user
    def run
        welcome
        login
        wanna_see_fav
        browse
    end

    private

    def welcome
        puts "Yo wassup homie. Do you know some Dogie facts?"
        sleep(0.9)
        puts "Get it"
        sleep(0.6)
        puts "Lets get started"
        sleep(0.3)
    end

    def login
        puts "Whats your nickname?"
        answer = gets.chomp
        user_exist = User.find_by(name: answer)

        if (user_exist)
            puts "Oh hi #{answer}! Long time no see!"
            @user = user_exist
        else
            puts "I see. You new here! Welcome #{answer}!"
            @user = User.create(name: answer)
        end
    end

    def wanna_see_fav
        puts "This is your favorite facts: "
        @user.facts.each_with_index do |fact, index|
            puts "#{index+1}. #{@user.facts[index].fact}"
        end
    end

    def browse
        puts "Browse for some facts? (y/n)"
        answer = gets.chomp

        while (answer == "y")
            facts = GetFacts.new
            # facts.fact_print
            facts.load_more
            if (facts.add_favorite != "none")
                favorite_fact = facts.favorite_fact
                new_fact = Fact.find_or_create_by(fact: favorite_fact)
                @user.facts << new_fact
                answer = "n"
            else
                nil
            end

        end
    end
end