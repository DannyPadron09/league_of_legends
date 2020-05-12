class LegendsChampions::Champion
    attr_accessor :name, :win_rate, :ban_rate, :abilities, :champion_url, :keybind, :ability_name, :ability_range, :ability_cost, :ability_cooldown, :ability_description

    @@all = []

    def initialize(name, win_rate, ban_rate, champion_url)
        @name = name
        @win_rate = win_rate
        @ban_rate = ban_rate
        @champion_url = champion_url
        # @abilities = abilities
        @@all << self
    end

    def self.all
        @@all
    end

    def self.list_champions
        @@all.each.with_index(1) do |champion, index|
            puts "#{index}. #{champion.name}"
        end
    end

    def self.find_by_index(index)
        @@all[index]
    end


end