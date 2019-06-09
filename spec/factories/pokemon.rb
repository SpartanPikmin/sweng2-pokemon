FactoryBot.define do
  factory :pokemon do
    hp { 100 }
    attack { 100 }
    defense { 100 }
    special_attack { 100 }
    special_defense { 100 }
    speed { 100 }
    move1{"tackle"}

    trait :Bulbasaur do
      species {"bulbasaur"}
      primary_type{"Grass"}
      secondary_type{"Poison"}
    end

    trait :Pikachu do
      species {"Pikachu"}
      primary_type{"Electric"}
    end

    trait :Squirtle do
      species {"Squirtle"}
      primary_type{"Water"}
    end

    trait :Sableye do
      species {"Sableye"}
      primary_type{"Ghost"}
      secondary_type{"Dark"}
    end

    trait :Fakemon do
      species {"Fakemon"}
      primary_type{"Ghost"}
    end

    trait :primary_type_dark do 
      primary_type{"Dark"}
    end

    trait :primary_type_grass do 
      primary_type{"Grass"}
    end

    trait :primary_type_ghost do 
      primary_type{"Ghost"}
    end

    trait :primary_type_poison do 
      primary_type{"Poison"}
    end

    trait :primary_type_normal do 
      primary_type{"Normal"}
    end

    trait :primary_type_flying do 
      primary_type{"Flying"}
    end

    trait :primary_type_fighting do 
      primary_type{"Fighting"}
    end

    trait :primary_type_fire do 
      primary_type{"Fire"}
    end

    trait :primary_type_water do 
      primary_type{"Water"}
    end

    trait :primary_type_electric do 
      primary_type{"Electric"}
    end

    trait :primary_type_ice do 
      primary_type{"Ice"}
    end

    trait :primary_type_ground do 
      primary_type{"Ground"}
    end

    trait :primary_type_psychic do 
      primary_type{"Psychic"}
    end

    trait :primary_type_bug do 
      primary_type{"Bug"}
    end

    trait :primary_type_rock do 
      primary_type{"Rock"}
    end

    trait :primary_type_dragon do 
      primary_type{"Dragon"}
    end

    trait :primary_type_steel do 
      primary_type{"Steel"}
    end

    trait :primary_type_fairy do 
      primary_type{"Fairy"}
    end

    trait :secondary_type_dark do 
      secondary_type{"Dark"}
    end

    trait :secondary_type_grass do 
      secondary_type{"Grass"}
    end

    trait :secondary_type_ghost do 
      secondary_type{"Ghost"}
    end

    trait :secondary_type_poison do 
      secondary_type{"Poison"}
    end

    trait :secondary_type_normal do 
      secondary_type{"Normal"}
    end

    trait :secondary_type_flying do 
      secondary_type{"Flying"}
    end

    trait :secondary_type_fighting do 
      secondary_type{"Fighting"}
    end

    trait :secondary_type_fire do 
      secondary_type{"Fire"}
    end

    trait :secondary_type_water do 
      secondary_type{"Water"}
    end

    trait :secondary_type_electric do 
      secondary_type{"Electric"}
    end

    trait :secondary_type_ice do 
      secondary_type{"Ice"}
    end

    trait :secondary_type_ground do 
      secondary_type{"Ground"}
    end

    trait :secondary_type_psychic do 
      secondary_type{"Psychic"}
    end

    trait :secondary_type_bug do 
      secondary_type{"Bug"}
    end

    trait :secondary_type_rock do 
      secondary_type{"Rock"}
    end

    trait :secondary_type_dragon do 
      secondary_type{"Dragon"}
    end

    trait :secondary_type_steel do 
      secondary_type{"Steel"}
    end

    trait :secondary_type_fairy do 
      secondary_type{"Fairy"}
    end
  end
end
