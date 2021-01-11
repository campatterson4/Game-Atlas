class GameAtlas::CLI

    def call
    list_consoles
    contents
    exit
    error
    end


def list_consoles
    puts "Welcome to Game Atlas! If you'd like to know the best selling video games of different consoles, you're in the right place!"
    @consoles = GameAtlas::Console.all
    @consoles.each.with_index(1) do |console, i|
        puts "#{i}. #{console.name}"
    end
end

def contents
input = nil
    while input != "exit"
        puts "Enter your desired number to reveal this console's most sold game, it's release date, and how many copies have been sold! Enter consoles to view the list again, or exit to leave the program!"
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i < 4
       console = @consoles[input.to_i-1]
       puts "#{console.game} - #{console.release} - #{console.sold}"
    elsif input == "consoles"
        list_consoles
    elsif input == "exit"
        puts "Thank you for using Game Atlas! Come back soon for updated lists and even more consoles!"
    else
        puts "Error. Try entering one of the commands below!"
    end
end
end
end
