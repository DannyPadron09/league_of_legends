class LegendsChampions::CLI  
    
    def call
        welcome
        list_champions
        menu 
        # exit_screen
    end

    def welcome
        puts <<-DOC


    _       ___  ____  ____ __ __   ___       ___  _____      _       ___  ____   ___ ____  ___   _____
   | |     /  _]/    |/    |  |  | /  _]     /   \ |     |    | |     /  _]/    | /  _|    \ |   \ / ___/
   | |    /  [_|  o  |   __|  |  |/  [_     |     |   __|    | |    /  [_|   __|/  [_|  _  |     (   \_ 
   | |___|    _|     |  |  |  |  |    _]    |  O  |  |_      | |___|    _|  |  |    _|  |  |  D  \__  |
   |     |   [_|  _  |  |_ |  :  |   [_     |     |   _]     |     |   [_|  |_ |   [_|  |  |     /  \ |
   |     |     |  |  |     |     |     |    |     |  |       |     |     |     |     |  |  |     \    |
   |_____|_____|__|__|___,_|\__,_ |_____|      \___/|__|       |_____|_____|___,_|_____|__|__|_____|\___|
                                                                                                       
                                           __ __ __  ____ ___ ___ ____ ____ ___  ____   _____          
                                          /  |  |  |/    |   |   |    |    /   \ |    \ /  ___/          
                                         /  /|  |  |  o  | _   _ |  o  |  |     |  _  (   \_           
                                        /  / |  _  |     |   \_/  |   _/|  |  O  |  |  |\__  |          
                                       /    \_|  |  |  _  |   |   |  |  |  |     |  |  |/  \ |          
                                       \      |  |  |  |  |   |   |  |  |  |     |  |  |\    |          
                                        \____ |__|__|__|__|___|___|__|  |____\___/|__|__| \___|          
                                                                                                       
 
 ===============================================================================================================
 
 
             PRESS 'ENTER' TO BEGIN!
  
  
 DOC

    input = gets.strip.downcase
    puts "Loading...
    this may take a minute..."
    LegendsChampions::ChampionScraper.scrape_champion_and_stats
    # LegendsChampions::Champion.new 
    # LegendsChampions::Champion.new
    end

    def list_champions

     LegendsChampions::Champion.list_champions
       
    end

    def menu
        champion_input = 0
        input = ""
        
        
        until input == "exit"
            puts puts "Enter the name of the Champion you would like to get more info on: "
            champion_input = gets.strip.downcase 


        if champion_input.to_i > 0
            champion_selection = LegendsChampions::Champion.find_by_index(champion_input.to_i - 1)
            puts <<-DOC

            Champion Name : #{champion_selection.name}

            Champion Win Rate : #{champion_selection.win_rate}

            Champion Ban Rate : #{champion_selection.ban_rate}

            Champion Ability Keybind : #{champion_selection.keybind}
            -----
            Champion Abilities : #{champion_selection.ability_name}


            Abilitiy Range :#{champion_selection.ability_range} ---
            -----
            Ability Cost :#{champion_selection.ability_cost} ---
            -----
            Ability Cooldown :#{champion_selection.ability_cooldown} ---


            Ability Description : #{champion_selection.ability_description}


            To see the list again enter 'list' or 'exit' to Exit.

            DOC

        input = gets.strip.downcase
        if input == "list"
            list_champions 
        else input == "exit"
            exit_screen
        end
    end
        end
        

    end

    def exit_screen
        puts <<-DOC

        ______  __ __   ____  ____   __  _  _____   _____   ___   ____      
       |      ||  |  | /    ||    \  |  |/ ]/ ___/  |     | /   \ |    \     
       |      ||  |  ||  o  ||  _  ||  ' /(   \_    |   __||     ||  D  )    
       |_|  |_||  _  ||     ||  |  ||    \  \__  |   |  |_  |  O  ||    /     
         |  |  |  |  ||  _  ||  |  ||    \ /  \  |   |   _) |     ||    \     
         |  |  |  |  ||  |  ||  |  ||  . |\     |   |  |   |     ||  .  \    
         |__|  |__|__||__|__||__|__||__|\_| \___|    |__|     \___/ |__|\_|    
                                                                              
         _____   ___   ____  ____     __  __ __  ____  ____    ____  __      
        / ___/  /  _] /    ||    \    /  ]|  |  ||    ||    \  /     ||  |     
       (   \_  /  [_ |  o  ||  D  )  /  / |  |  | |  | |  _  ||   __||  |     
        \__  ||    _]|     ||    /  /  /  |  _  | |  | |  |  ||  |  ||__|     
        /  \ ||   [_ |  _  ||    \  / \    _|  |  | |  | |  |  ||  |_ | __      
        \\   ||     ||  |  ||  .  \\      ||  |  | |  | |  |  ||     ||  |     
         \___||_____||__|__||__|\_| \  ____||__|__||____||__|__||___,_||__|     
                  
    DOC
    exit

    end

end