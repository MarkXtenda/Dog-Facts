class App 
    attr_reader :user, :username, :answer, :exit, :stay
    def run
        welcome
        while (@stay == 'y' && @exit != 'y')
            login
            wanna_see_fav
            browse
            exit
        end
        puts "Got it! See ya!"
    end

    private

    def initialize 
        @stay = 'y'
        @answer = 'y'
    end

    def welcome
        puts "Welcome to the DogFact!\nDo you want to learn some Dog facts?".blue
        sleep(0.9)
        puts "Get it".blue
        sleep(0.6)
        puts "Lets get started".blue
        sleep(0.3)
    end

    def login
        puts "Whats your nickname?"
        @username = gets.chomp
        reinitiate_user
        if (@user)
            puts "Oh hi #{@username}! Long time no see!".green
        else
            puts "I see. You new here! Welcome #{@username}!".green
            @user = User.create(name: @username)
        end
    end

    def wanna_see_fav
        puts "This is your favorite facts: \n"
        reinitiate_user
        if(@user.facts.size != 0)
            @user.facts.each_with_index do |fact, index|
                puts "#{index+1}. #{@user.facts[index].fact}".blue
            end
        else
            puts " - No facts, that you favor. For now ;)"
        end
    end

    def browse
        @answer = 'y'
        while (@answer != 'n')
        puts "Browse for some facts? (y/n)"
        @answer = gets.chomp

        (@answer == "y") ? load_fact : nil

        puts "Do you want to see your favorite facts? (y/n)"
        @answer = gets.chomp

        (@answer == 'y') ? load_favorites : nil
        end
    end

    def load_fact
        facts = GetFacts.new
            facts.fact_print
            if (facts.add_favorite != "none")
                favorite_fact = facts.favorite_fact
                if (!favorite_fact.blank?)
                    new_fact = Fact.find_or_create_by(fact: favorite_fact)
                    @user.facts << new_fact
                end
            else
                nil
            end
    end
    def load_favorites
        wanna_see_fav
        puts "Do you want to delete any of them? (y/n)".red
        @answer = gets.chomp
        while (@answer == 'y')
            puts "Which one of them you want to delete? (pick a number)"
            delete_num = gets.chomp.to_i
            reinitiate_user
            if (delete_num <= @user.facts.size && delete_num > 0)
                delete_fact = @user.facts[delete_num - 1].fact
                Fact.all.find_by(fact: delete_fact).destroy
                wanna_see_fav
            else
                puts "Sorry. Such fact is non-existent. Pick another one".red
                @answer = 'n'
            end
            if (@user.facts.size != 0)
                puts "Do you still want to delete one of your favorite facts? (y/n)".red
                @answer = gets.chomp
            end
        end
    end

    def reinitiate_user
        @user = User.all.find_by(name: @username)
    end

    def exit
        @exit = "none"
        puts "Do you want to exit? (y/n)".red
        @exit = gets.chomp
        while (@exit != 'y')
            browse
            puts "Do you want to exit? (y/n)".red
            @exit = gets.chomp
            if (@exit != 'n' && @exit != 'y' && @stay != 'y')
                puts "No such option exist."
                puts "(@exit != 'y' && @exit != 'n'): #{(@exit != 'y' && @exit != 'n')}"
                puts "@exit != 'n' && @exit != 'y' && @stay != 'y': #{@exit != 'n' && @exit != 'y' && @stay != 'y'}"
            end
        end
    end
end
