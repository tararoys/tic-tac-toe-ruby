require "game"

describe "gameboard output" do 

  it "looks like this wheeee!"  do    
    expect(show_gameboard).to eq("8 1 6\n3 5 7\n4 9 2")
  end
end
