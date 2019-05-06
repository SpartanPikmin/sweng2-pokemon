#allows for easier matching of more extreme weaknesses and resistances
#argument 0: base effectiveness e.g. SUPER_EFFECTIVE (which is 200)
#argument 1: effectiveness multiplier
	#example:
	# 'have_efficacy_of(200, 2)' would test if the given value has efficacy 400 (doubly supereffective)
RSpec::Matchers.define :have_efficacy_of do |*expected|
	match do |actual|
		actual == (expected[0]**expected[1]) / (100**(expected[1]-1))
	end
end