class PokemonBuilder
  attr_accessor :pokemons
  def initialize(params)
    @pokemons = []
    (1..6).each do |i|
      sym = "pokemon_#{i}".to_sym
      @pokemons << params[sym]
    end
  end

  def build
    @pokemons.map { |poke| Pokemon.new(species: 25) }
  end
end
