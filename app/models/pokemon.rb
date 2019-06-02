class Pokemon < ApplicationRecord
  belongs_to :team, optional: true 
  validates :primary_type, presence: true
  validates :species, presence: true
  validates :secondary_type, presence: true, allow_nil: true, allow_blank: true
  include Effect

  def types
    if primary_type and secondary_type
      [primary_type.to_sym, secondary_type.to_sym]
    elsif primary_type
      [primary_type.to_sym]
    else
      nil
    end
  end

  def types_to_s
    self.types.join(' ')
  end

  def efficacy_of(attack_type)
    Matchups.efficacy_of(source: attack_type, target: types)
  end

  def weaknesses
    Matchups.weaknesses_of(types)
  end

  def resistances
    Matchups.resistances_of(types)
  end

  def perform(big_dependency)
    big_dependency.execute
    return 42
  end

end
