class Numermaster
	def positive_negative(numbers)
		return nil unless numbers.is_a?(Array)
		numbers.each do |item|
			unless item.is_a?(Numeric)
				return nil
			end
		end
		neg_nums = numbers.select {|num| num < 0 }
		pos_nums = numbers.select {|num| num > 0 }
		if pos_nums.count > neg_nums.count
			pos_nums
		elsif pos_nums.count < neg_nums.count
			neg_nums
		else
			nil
		end
	end

	def maths_array(array = [])
		return nil unless array.is_a?(Array)
		return nil if array == []

		size = array.size
		mode = self.modes(array)
		mean = self.mean(array)
		median = median(array)
		[mode,median,mean,size]
	end

	def modes(array) 
		histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
		modes = nil 
		histogram.each_pair do |item, times| 
			modes << item if modes && times == modes[0] 
			modes = [times, item] if (!modes && times>1) or (modes && times>modes[0])
		end
		return nil unless modes
		return modes[*1 .. modes.size - 1]
	end

	def mean(array)
		mean = 0
		array.map {|i| mean += i }
		mean = mean / array.size 
	end

	def median(array)
		if array.size == 1
			array[0]
		elsif array.size.even?
			self.mean(array)
		else
			array[array.size / 2] 
		end
	end

	def fibonacci(n)
		return nil if n <= 0
		return 1 if n <= 2

		fibonacci(n-1) + fibonacci(n-2)
		array = [1,1]
		numbers = [*2 .. 2 + n]
		numbers.map do |index|
			array << array[index - 2] + array[index - 1]
		end
		array[n - 1]
	end
end

describe Numermaster do
	before do
		@number_master = Numermaster.new
	end 
	describe "#positive_negative" do
		it "should return positives if most of elements are positives" do
			expect(@number_master.positive_negative([1,2,3,-1,-2])).to eq([1,2,3])
		end
		it "should return negatives if most of elements are negatives" do
			expect(@number_master.positive_negative([1,2,-1,-2,-3])).to eq([-1,-2,-3])
		end
		it "should return nil if the amount of elements are the same" do
			expect(@number_master.positive_negative([1,2,0,-2,-3])).to be(nil)
		end
		it "should return nil for otherwise case" do
			expect(@number_master.positive_negative("hello")).to be(nil)
		end
	end
	describe "#maths_array" do
		it "Should take a set of numbers and return the mode, median, mean, and size of array" do
			expect(@number_master.maths_array([0, 8, 3, 11, 3])).to eq([3, 3, 5, 5])
		end
		it "should return nil in the event of an empty array" do
			expect(@number_master.maths_array).to eq(nil)
		end
	end
	describe "#fibonacci" do
		it "Should take the n-th number of the fibbonacci serie" do
			expect(@number_master.fibonacci(6)).to eq(8)
		end
		it "should return nil because n < 1" do
			expect(@number_master.fibonacci(0)).to eq(nil)
		end
		it "should return 1 because the first and second numbers are 1" do
			expect(@number_master.fibonacci(2)).to eq(1)
		end
	end
end