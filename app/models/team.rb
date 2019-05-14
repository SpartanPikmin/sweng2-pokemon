class Team < ApplicationRecord
  has_many :pokemon, dependent: :destroy
  validates :name, presence: true
  include Effect

  def efficacy_array
    [Effect::NO_EFFECT, Effect::NOT_VERY_EFFECTIVE / 2, Effect::NOT_VERY_EFFECTIVE, Effect::NORMAL_EFFECTIVENESS, Effect::SUPER_EFFECTIVE, Effect::SUPER_EFFECTIVE * 2]
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
  		total = Effect::NORMAL_EFFECTIVENESS
	  	pokemon.each do |p|
	  		total *= p.efficacy_of(attack_type)
	  		total /= Effect::NORMAL_EFFECTIVENESS
	  	end
  	end
  	total
  end

  def efficacy_hash
    effs = efficacy_array
    team_hash = Hash[effs.map {|e| [e, types_hash(e)]}]
  end

  def types_hash(effectiveness)
    types = Matchups.all_types
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
