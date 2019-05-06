RSpec::Matchers.define :have_weaknesses do |*expected|
  match do |actual|
      actual.weaknesses.to_set == expected.to_set
  end
end
