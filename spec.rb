# Christie Finnie
# Due: 2019-12-16

# Specs for testing the bowling score keeper

require "rspec"
require "./bowlingScoreKeeper.rb"


RSpec.describe "Bowler" do 


	context "When strike in frame 1" do 
        it "Score is nil" do 
            player = Bowler.new
            player.rolls("X")
            expect(player.score).to eq nil
		end
	end
	context "When strink in frame 1, spare in frame 2" do 
        it "Score is 20" do 
            player = Bowler.new
            player.rolls("X")
            player.rolls(7, "/")
            expect(player.score).to eq 20
		end
	end
	context "When strike in frame 1, 5 in frame 2" do 
        it "Score is 20" do 
            player = Bowler.new
            player.rolls("X")
            player.rolls(4, 1)
            expect(player.score).to eq 20
		end
	end
	context "When spare in frame 1" do 
        it "Score is nil" do 
            player = Bowler.new
            player.rolls(7, "/")
            expect(player.score).to eq nil
		end
	end

	context "When spare in frame 1, 0 for the first roll of frame 2" do 
        it "Score is 10" do 
            player = Bowler.new
            player.rolls(7, "/")
            player.rolls(0, "/")
            expect(player.score).to eq 10
		end
	end
	context "When there's a gutter for every single roll" do 
        it "Score is 0" do 
            player = Bowler.new
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            player.rolls(0, 0)
            expect(player.score).to eq 0
		end
	end
	context "When there's a strike for every single roll" do 
        it "Score is 300" do 
            player = Bowler.new
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X", "X", "X")
            expect(player.score).to eq 300
		end
    end

    context "When there's a strike for every single roll but the last is a 5" do 
        it "Score is 295" do 
            player = Bowler.new
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X")
            player.rolls("X", "X", 5)
            expect(player.score).to eq 295
		end
    end

    context "When there's a crazy mix 1" do 
        it "Score is 109" do 
            player = Bowler.new
            player.rolls("X")
            player.rolls(5, 1)
            player.rolls(1, 3)
            player.rolls(4, 5)
            player.rolls(7, 2)
            player.rolls(3, 6)
            player.rolls(4, 4)
            player.rolls(8, "/")
            player.rolls("X")
            player.rolls(6, 3)
            expect(player.score).to eq 109
		end
    end

    context "When there's a crazy mix 2" do 
        it "Score is 79" do 
            player = Bowler.new
            player.rolls(6, "/")
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls(3, 3)
            player.rolls("X", 5, 3)
            expect(player.score).to eq 79
		end
    end
end