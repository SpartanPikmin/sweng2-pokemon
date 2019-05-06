RSpec::Matchers.define :have_resistances do |*expected|
  match do |actual|
      actual.resistances.to_set == expected.to_set
  end
end
