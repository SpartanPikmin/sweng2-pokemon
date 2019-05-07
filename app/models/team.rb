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

  def types_array
    ["normal", "fighting", "flying", "poison", "ground", "rock", "bug", "ghost", "steel", "fire", "water", "grass", "electric", "psychic", "ice", "dragon", "dark", "fairy"]
  end

  def efficacy_array
    [Team.NO_EFFECT, Team.NOT_VERY_EFFECTIVE / 2, Team.NOT_VERY_EFFECTIVE, Team.NORMAL_EFFECTIVENESS, Team.SUPER_EFFECTIVE, Team.SUPER_EFFECTIVE * 2]
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
    effs = efficacy_array
    team_hash = Hash[effs.map {|e| [e, types_hash(e)]}]
  end

  def types_hash(effectiveness)
    types = types_array
    eff_hash = Hash[types.map {|t| [t, efficacy_count(effectiveness, t)]}]
  end

  def efficacy_count(effectiveness, attack_type)
    total = 0
    pokemon.each do |p|
      if p.efficacy_of(attack_type) == effectiveness
        total += 1
      end
    end
    total
  end

end
