class Pokemon < ApplicationRecord
  belongs_to :team, optional: true 
  validates :primary_type, presence: true
  validates :species, presence: true
  validates :secondary_type, presence: true, allow_nil: true, allow_blank: true
  validates :move1, presence: true
  validates :move2, presence: true, allow_nil: true, allow_blank: true
  validates :move3, presence: true, allow_nil: true, allow_blank: true
  validates :move4, presence: true, allow_nil: true, allow_blank: true
  validate :type_is_valid?

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

def type_is_valid?
  valid_types = ['dark','bug','grass','dragon','electric','fairy','fighting','fire','flying','ghost','ground','ice','normal','poison','psychic','rock','steel','water']
  if (primary_type != nil) and (secondary_type != nil)
    self.primary_type.downcase!
    self.secondary_type.downcase!
    valid_types.include?(primary_type) and valid_types.include?(secondary_type)
  elsif (primary_type != nil)
    self.primary_type.downcase!
    valid_types.include?(primary_type) 
  else
    false
  end
end

end
