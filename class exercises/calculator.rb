# We’ll start with something nice and easy so we learn this testing thing quickly.
# Write a class, called Calculator, that basically performs all four basic math operations: addition, substraction, multiplication and
# division. In order to keep it simple, all of them will have two numeric parameters.
# After writing your class, write several tests. For each one, print “OK” if it succeeded, “FAIL” otherwise, in order to test that
# everything is working out properly.

class Calculator

	def addition(n1, n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 + n2
		else
			return "NaN"
		end
	end

	def substraction(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 - n2
		else
			return "NaN"
		end
	end

	def multiplication(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 * n2
		else
			return "NaN"
		end
	end

	def division(n1,n2)
		if n1.is_a?(Numeric) && n2.is_a?(Numeric)
			return n1 / n2
		else
			return "NaN"
		end
	end

end

def assert(result, expectation)
	if result == expectation
		p "OK"
	else 
		p "FAIL"
	end
end

describe Calculator do
	before do
		@calculator = Calculator.new
	end

	describe "#addition" do 
		it "should add 5 and 6" do
			expect(@calculator.addition(5,6)).to eq(11)
		end
		it "add string, should be error" do
			expect(@calculator.addition("hello",6)).to eq("NaN")
		end
	end

	describe "#substraction" do 
		it "should less 5 and 6" do
			expect(@calculator.substraction(5,6)).to eq(-1)
		end
		it "less string, should be error" do
			expect(@calculator.substraction("hello",6)).to eq("NaN")
		end
	end

	describe "#multiplication" do 
		it "should multiplicate 5 and 6" do
			expect(@calculator.multiplication(5,6)).to eq(30)
		end
		it "multiplicate string, should be error" do
			expect(@calculator.multiplication("hello",6)).to eq("NaN")
		end
	end

	describe "#division" do 
		it "should divide 5 and 6" do
			expect(@calculator.division(5,6)).to eq(0)
		end
		it "divide string, should be error" do
			expect(@calculator.division("hello",6)).to eq("NaN")
		end
	end
end
