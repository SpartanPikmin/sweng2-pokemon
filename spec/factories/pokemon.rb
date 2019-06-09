FactoryBot.define do
  factory :pokemon do
    hp { 100 }
    attack { 100 }
    defense { 100 }
    special_attack { 100 }
    special_defense { 100 }
    speed { 100 }

    trait :Bulbasaur do
      species {"bulbasaur"}
      primary_type{"grass"}
      secondary_type{"poison"}
    end

    trait :Pikachu do
      species {"Pikachu"}
      primary_type {"electric"}
    end

    trait :Squirtle do
      species {"Squirtle"}
      primary_type{"water"}
    end

    trait :Sableye do
      species {"Sableye"}
      primary_type{"ghost"}
      secondary_type{"dark"}
    end

    trait :valid_pokemon do
      species {"Fakemon"}
      primary_type{"ghost"}
      secondary_type{"dark"}

    end

    trait :move1_tackle do 
      move1{"tackle"}
    end

    trait :primary_type_dark do 
      primary_type{"dark"}
    end

    trait :primary_type_grass do 
      primary_type{"grass"}
    end

    trait :primary_type_ghost do 
      primary_type{"ghost"}
    end

    trait :primary_type_poison do 
      primary_type{"poison"}
    end

    trait :primary_type_normal do 
      primary_type{"normal"}
    end

    trait :primary_type_flying do 
      primary_type{"flying"}
    end

    trait :primary_type_fighting do 
      primary_type{"fighting"}
    end

    trait :primary_type_fire do 
      primary_type{"fire"}
    end

    trait :primary_type_water do 
      primary_type{"water"}
    end

    trait :primary_type_electric do 
      primary_type{"electric"}
    end

    trait :primary_type_ice do 
      primary_type{"ice"}
    end

    trait :primary_type_ground do 
      primary_type{"ground"}
    end

    trait :primary_type_psychic do 
      primary_type{"psychic"}
    end

    trait :primary_type_bug do 
      primary_type{"bug"}
    end

    trait :primary_type_rock do 
      primary_type{"rock"}
    end

    trait :primary_type_dragon do 
      primary_type{"dragon"}
    end

    trait :primary_type_steel do 
      primary_type{"steel"}
    end

    trait :primary_type_fairy do 
      primary_type{"fairy"}
    end

    trait :secondary_type_dark do 
      secondary_type{"dark"}
    end

    trait :secondary_type_grass do 
      secondary_type{"grass"}
    end

    trait :secondary_type_ghost do 
      secondary_type{"ghost"}
    end

    trait :secondary_type_poison do 
      secondary_type{"poison"}
    end

    trait :secondary_type_normal do 
      secondary_type{"normal"}
    end

    trait :secondary_type_flying do 
      secondary_type{"flying"}
    end

    trait :secondary_type_fighting do 
      secondary_type{"fighting"}
    end

    trait :secondary_type_fire do 
      secondary_type{"fire"}
    end

    trait :secondary_type_water do 
      secondary_type{"water"}
    end

    trait :secondary_type_electric do 
      secondary_type{"electric"}
    end

    trait :secondary_type_ice do 
      secondary_type{"ice"}
    end

    trait :secondary_type_ground do 
      secondary_type{"ground"}
    end

    trait :secondary_type_psychic do 
      secondary_type{"psychic"}
    end

    trait :secondary_type_bug do 
      secondary_type{"bug"}
    end

    trait :secondary_type_rock do 
      secondary_type{"rock"}
    end

    trait :secondary_type_dragon do 
      secondary_type{"dragon"}
    end

    trait :secondary_type_steel do 
      secondary_type{"steel"}
    end

    trait :secondary_type_fairy do 
      secondary_type{"fairy"}
    end
  end
end
