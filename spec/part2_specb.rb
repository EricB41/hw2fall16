require 'part2.rb'

describe "#rps_game_winner" do
  it "should be defined" do
#    lambda { rps_game_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
    expect(lambda {rps_game_winner([["X", "P"], ["Y", "S"]])}).not_to raise_error
  end
  # this is given for free in the outline
  it "should raise WrongNumberOfPlayersError if there are not exactly two players" do
#    lambda { rps_game_winner([ ["Allen", "S"] ]) }.should raise_error, "No error raised for incorrect number of players"
    expect(lambda { rps_game_winner([ ["Allen", "S"] ]) }).to raise_error(WrongNumberOfPlayersError)
  end
  it "should raise NoSuchStrategyError if the players use characters other than 'R', 'P', or 'S' (case-insensitive)" do
    expect(lambda { rps_game_winner([ ["Allen", "R"],  ["Allen", "R"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "P"],  ["Allen", "P"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "S"],  ["Allen", "S"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "r"],  ["Allen", "r"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "p"],  ["Allen", "p"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "s"],  ["Allen", "s"]]) }).not_to raise_error
    expect(lambda { rps_game_winner([ ["Allen", "x"],  ["Allen", "r"]]) }).to raise_error(NoSuchStrategyError)
    expect(lambda { rps_game_winner([ ["Allen", "r"],  ["Allen", "b"]]) }).to raise_error(NoSuchStrategyError)
  end
  it "If both players use the same strategy, return the first player " do
    expect(rps_game_winner([["Mary", "R"], ["John", "r"]])).to eq(["Mary", "R"])
    expect(rps_game_winner([["John", "s"], ["Mary", "S"]])).to eq(["John", "s"])
  end
  
  it "should return the name and strategy of the winning player if they use different strategies" do
    expect(rps_game_winner([["Mary", "R"], ["John", "p"]])).to eq(["John", "p"])
    expect(rps_game_winner([["Mary", "R"], ["John", "s"]])).to eq(["Mary", "R"])
    expect(rps_game_winner([["Mary", "P"], ["John", "r"]])).to eq(["Mary", "P"])
    expect(rps_game_winner([["Mary", "P"], ["John", "s"]])).to eq(["John", "s"])
    expect(rps_game_winner([["Mary", "S"], ["John", "r"]])).to eq(["John", "r"])
    expect(rps_game_winner([["Mary", "S"], ["John", "p"]])).to eq(["Mary", "S"])
  end
end

describe "#rps_tournament_winner" do
  it "should be defined" do
#    lambda { rps_tournament_winner([["X", "P"], ["Y", "S"]]) }.should_not raise_error
    expect(lambda { rps_tournament_winner([["X", "P"], ["Y", "S"]]) }).not_to raise_error
  end
  
  it "Should return the correct winner of the tournament" do
    expect(rps_tournament_winner([
                                    [
                                        [["Joe", "P"], ["Mary", "S"]],
                                        [["Bob", "R"], ["Alice", "S"]]
                                    ],
                                    [
                                        [["Steve", "S"], ["Jane", "P"]],
                                        [["Ted", "R"], ["Carol", "P"]]
                                    ]
                                ])).to eq(["Bob", "R"])
    expect(rps_tournament_winner([
                                    [
                                        [
                                            [["Joe", "P"], ["Mary", "S"]],
                                            [["Bob", "R"], ["Alice", "S"]]
                                        ],
                                        [
                                            [["Steve", "S"], ["Jane", "P"]],
                                            [["Ted", "R"], ["Carol", "P"]]
                                        ] #Bob, R wins this one
                                    ],
                                    [
                                        [
                                            [["James", "R"], ["Ann", "P"]], #paper wins
                                            [["Billy", "S"], ["Joe", "R"]]  #rock wins
                                        ], #paper Ann wins
                                        [
                                            [["Danny", "R"], ["Helen", "P"]],
                                            [["Otis", "S"], ["Andy", "R"]]
                                        ] #paper helen 
                                    ]
                                ])).to eq(["Ann", "P"])
    expect(rps_tournament_winner([["Mary", "S"], ["John", "p"]])).to eq(["Mary", "S"])
  end
end
