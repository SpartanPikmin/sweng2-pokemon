class BigDependency
	def execute
		sleep(5)
	end
end

class FakeBigDependency < BigDependency
	def execute
		5
	end
end