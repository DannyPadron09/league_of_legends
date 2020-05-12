class LegendsChampions::ChampionScraper

    def self.scrape_champion_and_stats
        doc = Nokogiri::HTML(open("https://www.mobafire.com/league-of-legends/champions"))
        all_champions = doc.css("div.champ-list.champ-list--details.self-clear")
        all_champions.css("a.champ-list__item.visible").each do |champion|
            name = champion.css("div.champ-list__item__name b").text,
            win_rate = champion.css("div.original").text,
            ban_rate = champion.css("div.champ-list__item__banP").text
            champion_url = champion.attr('href')
            new_champion = LegendsChampions::Champion.new(name[0], win_rate, ban_rate, champion_url)
            scrape_champion_abilities(new_champion)
        end
    end
    
    def self.scrape_champion_abilities(new_champion)
        abilities_page = Nokogiri::HTML(open("https://mobafire.com#{new_champion.champion_url}/abilities"))
        champion_abilities = abilities_page.css("div.champ-abilities.champ-abilities--details")
        # champion_abilities.css("a.champ-abilities__item.champ-abilities__item--passive").each do |passive|
            # passive_name = passive.css("div.champ-abilities__item__name").text.split("\n").join(" ")
            # passive_description = passive.css("div.champ-abilities__item__desc").text.split("\n")
            # end
        champion_abilities.css("a.champ-abilities__item").each do |ability|
            new_champion.keybind = ability.css("div.champ-abilities__item__letter").text 
            new_champion.ability_name = ability.css("div.champ-abilities__item__name").text.split("\n").join(" ")
            new_champion.ability_range = ability.css("div.champ-abilities__item__range").text
            new_champion.ability_cost = ability.css("div.champ-abilities__item__range").text
            new_champion.ability_cooldown = ability.css("div.champ-abilities__item__cooldown").text
            new_champion.ability_description = ability.css("div.champ-abilities__item__desc").text
        end
    end
    # binding.pry

end