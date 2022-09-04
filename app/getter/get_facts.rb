require 'net/http'
require 'open-uri'
require 'json'


class GetFacts
    attr_reader :all_facts, :favorite_fact
    URL = "https://dog-api.kinduff.com/api/facts?number=5.json"
    
    def initialize()
        @all_facts = []
    end

    def get_facts
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def fact_print
        fact_json = JSON.parse(self.get_facts)
        fact_json["facts"].each_with_index do |fact, index|
            @all_facts << fact_json["facts"][index]
            puts "#{index+1}. #{fact_json["facts"][index]}"
        end
    end

    def load_more
        puts "Load more? (y/n)"
        answer = gets.chomp
        if (answer == "y")
            @all = []
            fact_print        
        end
    end

    def add_favorite
        puts "Want to add one to your favorite facts? (y/n)"
        answer = gets.chomp
        if (answer == "y")
            puts "which one of them you wish to add? (pick a number)"
            number = gets.chomp.to_i
            if (number > 0 && number < 6)
                @favorite_fact = @all_facts[number-1]
                puts "You saved the fact number: #{number}"
                puts "#{@favorite_fact}"
            else
                puts "No facts has been added."
                "none"
            end
        end
    end
end

