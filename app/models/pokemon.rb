class Pokemon < ApplicationRecord
  belongs_to :team

  def types
    if primary_type and secondary_type
      [primary_type, secondary_type]
    elsif primary_type
      [primary_type]
    else
      nil
    end
  end
end
