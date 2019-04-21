class Team < ApplicationRecord
    has_many :pokemon, dependent: :destroy

    def can_fight?
        pokemon.length > 0
    end

    def add(new_pokemon)
        pokemon << new_pokemon
    end
end
