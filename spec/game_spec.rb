require "game"

describe "Winning Move" do
  it "chooses the winning move" do
    player = ComputerPlayer.new("x")
    player.moves=[8, 1]
    game = Game.new
    game.stub(:gameboard).and_return(['x','x',6,'O','O',7,4,9,2])
    win = player.winning_move(game)
    expect(win).to eq(6) 
  end

  it "chooses the winning move" do
    player = ComputerPlayer.new("O")
    player.moves=[5, 3]
    game = Game.new
    game.stub(:gameboard).and_return(['x','x',6,'O','O',7,4,9,2])
    win = player.winning_move(game)
    expect(win).to eq(7) 
  end
end

describe "Game" do
  describe "#count" do
    it "counts the number of times a string is in an array" do 
      game = Game.new
      game.stub(:gameboard).and_return(['x','x',6,'O','O',7,4,9,2])
      expect(game.count("x")).to eq(2)
    end
  end
end
