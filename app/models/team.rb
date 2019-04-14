class Team
    def initialize
        @members = []
    end
    def can_fight?
        @members.length > 0
    end
    def add(pokemon)
        @members << pokemon
    end
end
