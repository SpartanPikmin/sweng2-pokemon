class Team < ApplicationRecord
  has_many :pokemon, dependent: :destroy
  validates :name, presence: true

  def self.SUPER_EFFECTIVE
    200
  end

  def self.NORMAL_EFFECTIVENESS
    100
  end

  def self.NOT_VERY_EFFECTIVE
    50
  end

  def self.NO_EFFECT
    0
  end

  def can_fight?
    pokemon.length > 0
  end

  def add(new_pokemon)
    pokemon << new_pokemon
  end

  def has_pokemon?(pokemon)
  	pokemon.include?(pokemon)
  end

  def team_efficacy_of(attack_type)
  	total = 0
  	if pokemon.length != 0
  		total = Team.NORMAL_EFFECTIVENESS
	  	pokemon.each do |p|
	  		total *= p.efficacy_of(attack_type)
	  		total /= Team.NORMAL_EFFECTIVENESS
	  	end
  	end
  	total
  end

  def efficacy_hash
  	types = types_array
  	h = Hash[types.map {|t| [t, team_efficacy_of(t)]}]
  end

  def types_array
  	["normal", "fighting", "flying", "poison", "ground", "rock", "bug", "ghost", "steel", "fire", "water", "grass", "electric", "psychic", "ice", "dragon", "dark", "fairy"]
  end
end
