class GameAtlas::Console

attr_accessor :name, :game, :release, :sold

    def self.all
    self.scrape_consoles
    end

    def self.scrape_consoles
        
        consoles = []

        consoles << self.scrape_ps
        consoles << self.scrape_xbox
        consoles << self.scrape_switch
       
    consoles
        
    end

    def self.scrape_ps
        doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Grand_Theft_Auto_V"))
        
    
    console = self.new
    console.name = "Playstation"
    console.game = doc.search("h1.firstHeading").text
    console.release = doc.search("div.NavHead").text
    console.sold = "20 Million Copies Sold!"
    console
    end


def self.scrape_xbox
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Halo_2"))

    console = self.new
    console.name = "Xbox"
    console.game = doc.search("h1.firstHeading").text
    console.release = doc.search("div.NavHead").text
    console.sold = "8.46 Million Copies Sold!"
    console
end


def self.scrape_switch
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Mario_Kart_8#Mario_Kart_8_Deluxe"))

        console = self.new
        console.name = "Nintendo Switch"
        console.game = doc.search("h1.firstHeading").text
        console.release = "April 28, 2017"
        console.sold = "28.99 Million Copies Sold!"
        console

end
end