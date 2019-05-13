class Pokemon < ApplicationRecord
  belongs_to :team, optional: true 
  include Effect

  def types
    if primary_type and secondary_type
      [primary_type, secondary_type]
    elsif primary_type
      [primary_type]
    else
      nil
    end
  end

  def types_to_s
    self.types.join(' ')
  end

  def multiply_matchups(a, b)
    efficacy1 = a.efficacy
    efficacy2 = b ? b.efficacy : Effect::NORMAL_EFFECTIVENESS
    efficacy1 * efficacy2 / Effect::NORMAL_EFFECTIVENESS
  end

  def efficacy_of(attack_type)
    matchup1 = TypeMatchup.find_by(source: attack_type, target: primary_type)
    matchup2 = TypeMatchup.find_by(source: attack_type, target: secondary_type)
    multiply_matchups(matchup1, matchup2)
  end

  def weaknesses
    primary_weaknesses = TypeMatchup.where(target: primary_type)
    secondary_weaknesses = TypeMatchup.where(target: secondary_type)
    primary_weaknesses.zip(secondary_weaknesses).select do |matchup|
        multiply_matchups(matchup[0], matchup[1]) > Effect::NORMAL_EFFECTIVENESS
    end.map do |matchup|
        matchup[0].source
    end
  end

  def resistances
    primary_weaknesses = TypeMatchup.where(target: primary_type)
    secondary_weaknesses = TypeMatchup.where(target: secondary_type)
    primary_weaknesses.zip(secondary_weaknesses).select do |matchup|
        multiply_matchups(matchup[0], matchup[1]) < Effect::NORMAL_EFFECTIVENESS
    end.map do |matchup|
        matchup[0].source
    end
  end

end
