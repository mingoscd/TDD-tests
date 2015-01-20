# SL2. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the tast. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

class SeriesMasterOfTheUniverse 
  
    RATINGS = {

    "Game of Thrones" => 10, 
    "The Knick" => 8, 
    "Halt and Catch Fire" => 9, 
    "Aida" => 0
  }

  def best_serie_2014
    sorted_shows(RATINGS.keys).first
    
  end

  def worst_serie_2014
    sorted_shows(RATINGS.keys).last
  end

private

  def sort_series
   RATINGS.sort do |show_name|
      RATINGS[show_name]
    end
  end

end


#### TEST RSPEC ####
describe SeriesMasterOfTheUniverse do
  before do 
    @abc = SeriesMasterOfTheUniverse.new
    
  end

  describe "best_serie_2014" do 
    it "should return the best serie" do
      expect(@abc.best_serie_2014(@sorted_ratings)).to eq("Game of Thrones") 
    end
  end

  describe "worst_serie_2014" do
    it "should return the worst serie" do
      expect(@abc.worst_serie_2014(@sorted_ratings).to eq("Aida")
    end
  end

end


# abc = SeriesMasterOfTheUniverse.new
# print abc.sort_series_by_value