class Matchups

  def self.efficacy_of(args)
    source = args[:source]
    target_types = args[:target]
    efficacies = target_types.map do |defend_type|
      if(defend_type == nil ){
        
      }
      else
        efficacy_table[ [source, defend_type] ]
    end
    multiply_efficacies(efficacies)
  end

  def self.multiply_efficacies(efficacies)
    efficacies.reduce { |product, eff| (product * eff) / 100 }
  end

  def self.weaknesses_of(target_types)
    all_types.select do |attack_type|
      efficacies = efficacy_of(source: attack_type, target: target_types)
      efficacies > 100
    end
  end

  def self.resistances_of(target_types)
    all_types.select do |attack_type|
      efficacies = efficacy_of(source: attack_type, target: target_types)
      efficacies < 100 and efficacies > 0
    end
  end

  def self.all_types
    [:normal, :fighting, :flying, :poison, :ground, :rock, :bug, :ghost, :steel, :fire, :water, :grass, :electric, :psychic, :ice, :dragon, :dark, :fairy]
  end

  def self.efficacy_table
    {
      [:normal, :normal] => 100,
      [:normal, :fighting] => 100,
      [:normal, :flying] => 100,
      [:normal, :poison] => 100,
      [:normal, :ground] => 100,
      [:normal, :rock] => 50,
      [:normal, :bug] => 100,
      [:normal, :ghost] => 0,
      [:normal, :steel] => 50,
      [:normal, :fire] => 100,
      [:normal, :water] => 100,
      [:normal, :grass] => 100,
      [:normal, :electric] => 100,
      [:normal, :psychic] => 100,
      [:normal, :ice] => 100,
      [:normal, :dragon] => 100,
      [:normal, :dark] => 100,
      [:normal, :fairy] => 100,
      [:fighting, :normal] => 200,
      [:fighting, :fighting] => 100,
      [:fighting, :flying] => 50,
      [:fighting, :poison] => 50,
      [:fighting, :ground] => 100,
      [:fighting, :rock] => 200,
      [:fighting, :bug] => 50,
      [:fighting, :ghost] => 0,
      [:fighting, :steel] => 200,
      [:fighting, :fire] => 100,
      [:fighting, :water] => 100,
      [:fighting, :grass] => 100,
      [:fighting, :electric] => 100,
      [:fighting, :psychic] => 50,
      [:fighting, :ice] => 200,
      [:fighting, :dragon] => 100,
      [:fighting, :dark] => 200,
      [:fighting, :fairy] => 50,
      [:flying, :normal] => 100,
      [:flying, :fighting] => 200,
      [:flying, :flying] => 100,
      [:flying, :poison] => 100,
      [:flying, :ground] => 100,
      [:flying, :rock] => 50,
      [:flying, :bug] => 200,
      [:flying, :ghost] => 100,
      [:flying, :steel] => 50,
      [:flying, :fire] => 100,
      [:flying, :water] => 100,
      [:flying, :grass] => 200,
      [:flying, :electric] => 50,
      [:flying, :psychic] => 100,
      [:flying, :ice] => 100,
      [:flying, :dragon] => 100,
      [:flying, :dark] => 100,
      [:flying, :fairy] => 100,
      [:poison, :normal] => 100,
      [:poison, :fighting] => 100,
      [:poison, :flying] => 100,
      [:poison, :poison] => 50,
      [:poison, :ground] => 50,
      [:poison, :rock] => 50,
      [:poison, :bug] => 100,
      [:poison, :ghost] => 50,
      [:poison, :steel] => 0,
      [:poison, :fire] => 100,
      [:poison, :water] => 100,
      [:poison, :grass] => 200,
      [:poison, :electric] => 100,
      [:poison, :psychic] => 100,
      [:poison, :ice] => 100,
      [:poison, :dragon] => 100,
      [:poison, :dark] => 100,
      [:poison, :fairy] => 200,
      [:ground, :normal] => 100,
      [:ground, :fighting] => 100,
      [:ground, :flying] => 0,
      [:ground, :poison] => 200,
      [:ground, :ground] => 100,
      [:ground, :rock] => 200,
      [:ground, :bug] => 50,
      [:ground, :ghost] => 100,
      [:ground, :steel] => 200,
      [:ground, :fire] => 200,
      [:ground, :water] => 100,
      [:ground, :grass] => 50,
      [:ground, :electric] => 200,
      [:ground, :psychic] => 100,
      [:ground, :ice] => 100,
      [:ground, :dragon] => 100,
      [:ground, :dark] => 100,
      [:ground, :fairy] => 100,
      [:rock, :normal] => 100,
      [:rock, :fighting] => 50,
      [:rock, :flying] => 200,
      [:rock, :poison] => 100,
      [:rock, :ground] => 50,
      [:rock, :rock] => 100,
      [:rock, :bug] => 200,
      [:rock, :ghost] => 100,
      [:rock, :steel] => 50,
      [:rock, :fire] => 200,
      [:rock, :water] => 100,
      [:rock, :grass] => 100,
      [:rock, :electric] => 100,
      [:rock, :psychic] => 100,
      [:rock, :ice] => 200,
      [:rock, :dragon] => 100,
      [:rock, :dark] => 100,
      [:rock, :fairy] => 100,
      [:bug, :normal] => 100,
      [:bug, :fighting] => 50,
      [:bug, :flying] => 50,
      [:bug, :poison] => 50,
      [:bug, :ground] => 100,
      [:bug, :rock] => 100,
      [:bug, :bug] => 100,
      [:bug, :ghost] => 50,
      [:bug, :steel] => 50,
      [:bug, :fire] => 50,
      [:bug, :water] => 100,
      [:bug, :grass] => 200,
      [:bug, :electric] => 100,
      [:bug, :psychic] => 200,
      [:bug, :ice] => 100,
      [:bug, :dragon] => 100,
      [:bug, :dark] => 200,
      [:bug, :fairy] => 50,
      [:ghost, :normal] => 0,
      [:ghost, :fighting] => 100,
      [:ghost, :flying] => 100,
      [:ghost, :poison] => 100,
      [:ghost, :ground] => 100,
      [:ghost, :rock] => 100,
      [:ghost, :bug] => 100,
      [:ghost, :ghost] => 200,
      [:ghost, :steel] => 100,
      [:ghost, :fire] => 100,
      [:ghost, :water] => 100,
      [:ghost, :grass] => 100,
      [:ghost, :electric] => 100,
      [:ghost, :psychic] => 200,
      [:ghost, :ice] => 100,
      [:ghost, :dragon] => 100,
      [:ghost, :dark] => 50,
      [:ghost, :fairy] => 100,
      [:steel, :normal] => 100,
      [:steel, :fighting] => 100,
      [:steel, :flying] => 100,
      [:steel, :poison] => 100,
      [:steel, :ground] => 100,
      [:steel, :rock] => 200,
      [:steel, :bug] => 100,
      [:steel, :ghost] => 100,
      [:steel, :steel] => 50,
      [:steel, :fire] => 50,
      [:steel, :water] => 50,
      [:steel, :grass] => 100,
      [:steel, :electric] => 50,
      [:steel, :psychic] => 100,
      [:steel, :ice] => 200,
      [:steel, :dragon] => 100,
      [:steel, :dark] => 100,
      [:steel, :fairy] => 200,
      [:fire, :normal] => 100,
      [:fire, :fighting] => 100,
      [:fire, :flying] => 100,
      [:fire, :poison] => 100,
      [:fire, :ground] => 100,
      [:fire, :rock] => 50,
      [:fire, :bug] => 200,
      [:fire, :ghost] => 100,
      [:fire, :steel] => 200,
      [:fire, :fire] => 50,
      [:fire, :water] => 50,
      [:fire, :grass] => 200,
      [:fire, :electric] => 100,
      [:fire, :psychic] => 100,
      [:fire, :ice] => 200,
      [:fire, :dragon] => 50,
      [:fire, :dark] => 100,
      [:fire, :fairy] => 100,
      [:water, :normal] => 100,
      [:water, :fighting] => 100,
      [:water, :flying] => 100,
      [:water, :poison] => 100,
      [:water, :ground] => 200,
      [:water, :rock] => 200,
      [:water, :bug] => 100,
      [:water, :ghost] => 100,
      [:water, :steel] => 100,
      [:water, :fire] => 200,
      [:water, :water] => 50,
      [:water, :grass] => 50,
      [:water, :electric] => 100,
      [:water, :psychic] => 100,
      [:water, :ice] => 100,
      [:water, :dragon] => 50,
      [:water, :dark] => 100,
      [:water, :fairy] => 100,
      [:grass, :normal] => 100,
      [:grass, :fighting] => 100,
      [:grass, :flying] => 50,
      [:grass, :poison] => 50,
      [:grass, :ground] => 200,
      [:grass, :rock] => 200,
      [:grass, :bug] => 50,
      [:grass, :ghost] => 100,
      [:grass, :steel] => 50,
      [:grass, :fire] => 50,
      [:grass, :water] => 200,
      [:grass, :grass] => 50,
      [:grass, :electric] => 100,
      [:grass, :psychic] => 100,
      [:grass, :ice] => 100,
      [:grass, :dragon] => 50,
      [:grass, :dark] => 100,
      [:grass, :fairy] => 100,
      [:electric, :normal] => 100,
      [:electric, :fighting] => 100,
      [:electric, :flying] => 200,
      [:electric, :poison] => 100,
      [:electric, :ground] => 0,
      [:electric, :rock] => 100,
      [:electric, :bug] => 100,
      [:electric, :ghost] => 100,
      [:electric, :steel] => 100,
      [:electric, :fire] => 100,
      [:electric, :water] => 200,
      [:electric, :grass] => 50,
      [:electric, :electric] => 50,
      [:electric, :psychic] => 100,
      [:electric, :ice] => 100,
      [:electric, :dragon] => 50,
      [:electric, :dark] => 100,
      [:electric, :fairy] => 100,
      [:psychic, :normal] => 100,
      [:psychic, :fighting] => 200,
      [:psychic, :flying] => 100,
      [:psychic, :poison] => 200,
      [:psychic, :ground] => 100,
      [:psychic, :rock] => 100,
      [:psychic, :bug] => 100,
      [:psychic, :ghost] => 100,
      [:psychic, :steel] => 50,
      [:psychic, :fire] => 100,
      [:psychic, :water] => 100,
      [:psychic, :grass] => 100,
      [:psychic, :electric] => 100,
      [:psychic, :psychic] => 50,
      [:psychic, :ice] => 100,
      [:psychic, :dragon] => 100,
      [:psychic, :dark] => 0,
      [:psychic, :fairy] => 100,
      [:ice, :normal] => 100,
      [:ice, :fighting] => 100,
      [:ice, :flying] => 200,
      [:ice, :poison] => 100,
      [:ice, :ground] => 200,
      [:ice, :rock] => 100,
      [:ice, :bug] => 100,
      [:ice, :ghost] => 100,
      [:ice, :steel] => 50,
      [:ice, :fire] => 50,
      [:ice, :water] => 50,
      [:ice, :grass] => 200,
      [:ice, :electric] => 100,
      [:ice, :psychic] => 100,
      [:ice, :ice] => 50,
      [:ice, :dragon] => 200,
      [:ice, :dark] => 100,
      [:ice, :fairy] => 100,
      [:dragon, :normal] => 100,
      [:dragon, :fighting] => 100,
      [:dragon, :flying] => 100,
      [:dragon, :poison] => 100,
      [:dragon, :ground] => 100,
      [:dragon, :rock] => 100,
      [:dragon, :bug] => 100,
      [:dragon, :ghost] => 100,
      [:dragon, :steel] => 50,
      [:dragon, :fire] => 100,
      [:dragon, :water] => 100,
      [:dragon, :grass] => 100,
      [:dragon, :electric] => 100,
      [:dragon, :psychic] => 100,
      [:dragon, :ice] => 100,
      [:dragon, :dragon] => 200,
      [:dragon, :dark] => 100,
      [:dragon, :fairy] => 0,
      [:dark, :normal] => 100,
      [:dark, :fighting] => 50,
      [:dark, :flying] => 100,
      [:dark, :poison] => 100,
      [:dark, :ground] => 100,
      [:dark, :rock] => 100,
      [:dark, :bug] => 100,
      [:dark, :ghost] => 200,
      [:dark, :steel] => 100,
      [:dark, :fire] => 100,
      [:dark, :water] => 100,
      [:dark, :grass] => 100,
      [:dark, :electric] => 100,
      [:dark, :psychic] => 200,
      [:dark, :ice] => 100,
      [:dark, :dragon] => 100,
      [:dark, :dark] => 50,
      [:dark, :fairy] => 50,
      [:fairy, :normal] => 100,
      [:fairy, :fighting] => 200,
      [:fairy, :flying] => 100,
      [:fairy, :poison] => 50,
      [:fairy, :ground] => 100,
      [:fairy, :rock] => 100,
      [:fairy, :bug] => 100,
      [:fairy, :ghost] => 100,
      [:fairy, :steel] => 50,
      [:fairy, :fire] => 50,
      [:fairy, :water] => 100,
      [:fairy, :grass] => 100,
      [:fairy, :electric] => 100,
      [:fairy, :psychic] => 100,
      [:fairy, :ice] => 100,
      [:fairy, :dragon] => 200,
      [:fairy, :dark] => 200,
      [:fairy, :fairy] => 100,
    }
  end
end
