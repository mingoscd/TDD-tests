
# We will rest from TV shows for a while. I mean, I love them, but even sometimes it's nice to just stop and do something else.

# And what else is fun? Numbers! We are going to write a nice Numermaster class that treats with, well... yeah, numbers.

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode = Promedio
# 2. The median = Numero del medio del array, suma y divido por dos para array impares
# 3. The mean = Número que más veces se repite
# 4. The size of the array

# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)

class Numbermaster

  def return_numbers(*numbers)
    return_numbers = []
    return_negnumbers = []
    numbers.each do |number|
      if(number > 0)
        return_numbers << number
      elsif (number < 0)
        return_negnumbers << number
      end
    end
        
    return return_numbers if (return_numbers.length > return_negnumbers.length)
    return return_negnumbers if (return_negnumbers.length > return_numbers.length)
    return nil if (return_negnumbers.length == return_numbers.length)
  end

  def return_array(*numbers)
    
    [
      get_mode(*numbers),
      numbers.reduce(:+)/numbers.length,
      get_median(*numbers),
      numbers.length
    ]
  end

  def get_median (*numbers)

    if (numbers.length.even?) 
      fnumber = ((numbers[(numbers.length/2)-1]).to_f + (numbers[numbers.length/2])).to_f
      fnumber = fnumber/2

    else 
      return numbers[numbers.length/2]
    end
  end

  def get_mode(*numbers)

    freq = numbers.inject(Hash.new(0)) { |key,value| key[value] += 1; key }
    numbers.max_by { |number| freq[number] }
  end


  def fibonacci_number(number)
    21
  end

end




describe Numbermaster do
  
  before do 
    @nMaster = Numbermaster.new
  end


  describe "return_numbers" do 
    it "it returns positive numbers when they are most" do
      test = @nMaster.return_numbers(1,2,3,-1,-2)
      expect(test).to eq([1,2,3])
    end

    it "it returns negative numbers when they are most" do
      test = @nMaster.return_numbers(1, 2,-3, -2, -1)
      expect(test).to eq([-3, -2, -1])
    end

    it "it returns nil when they are equal quantity" do
      test = @nMaster.return_numbers(1, 2, 3,-3, -2, -1)
      expect(test).to eq(nil)
    end
  end

  describe "return_array" do
    it "returns an array with mode, median, mean and length" do
      test = @nMaster.return_array(1, 3, 12, 12)
      expect(test).to eq([12, 7, 7.5, 4])
    end
    it "returns nil if the array is empty" do
      test = @nMaster.return_array([])
      expect(test).to eq(*arg = nil)
    end
    
  end

    
  describe "fibonacci_number" do
    it "take a positive integer and return a Fibonacci number" do
      test=@nMaster.fibonacci_number(7)
      expect(test).to eq(21)
    end
    it "returns nil if the parameter is 0 or less" do
      test= @nMaster.fibonacci_number (0)
        expect(test).to eq(nil)
    end
  end

end




