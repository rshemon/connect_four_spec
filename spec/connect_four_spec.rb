require './lib/connect_four'

RSpec.describe ConnectFour do
  describe "#check_win" do
    it "row win condition" do
      game = ConnectFour.new
      game.board = [["_", "_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"],
    ["X","_","_","_","_","_"], ["X","_","_","_","_","_"], ["X","_","_","_","_","_"], ["X","_","_","_","_","_"]]
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "col win condition" do
      game = ConnectFour.new
      game.board = [["X", "X","X","X","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"],
    ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"]]
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "col win condition" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"],
    ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","X","X","X","X"], ["_","_","_","_","_","_"]]
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "diag win condition" do
      game = ConnectFour.new
      game.board = [["X","_","_","_","_","_"], ["_","X","_","_","_","_"], ["_","_","X","_","_","_"],
    ["_","_","_","X","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "diag win condition" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"],
    ["X","_","_","_","_","_"], ["_","X","_","_","_","_"], ["_","_","X","_","_","_"], ["_","_","_","X","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "diag win condition" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","X","_","_","_"],
    ["_","_","_","X","_","_"], ["_","_","_","_","X","_"], ["_","_","_","_","_","X"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "diag win corner condition 1" do
      game = ConnectFour.new
      game.board = [["_","_","X","_","_","_"], ["_","_","_","X","_","_"], ["_","_","_","_","X","_"],
    ["_","_","_","_","_","X"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "diag win corner condition 2" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","_"], ["_","_","X","_","_","_"], ["_","_","_","X","_","_"],
    ["_","_","_","_","X","_"], ["_","_","_","_","_","X"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "anti-diag win condition" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","X"], ["_","_","_","_","X","_"], ["_","_","_","X","_","_"],
    ["_","_","X","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "anti-diag win condition" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","_","_"],
    ["_","_","_","X","_","_"], ["_","_","X","_","_","_"], ["_","X","_","_","","_"], ["X","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "anti-diag win corner condition 1" do
      game = ConnectFour.new
      game.board = [["_","_","_","_","X","_"], ["_","_","_","X","_","_"], ["_","_","X","_","_","_"],
    ["_","X","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end

    it "anti-diag win corner condition 2" do
      game = ConnectFour.new
      game.board = [["_","_","_","X","_","_"], ["_","_","X","_","_","_"], ["_","X","_","_","_","_"],
    ["X","_","_","_","_","_"], ["_","_","_","_","_","_"], ["_","_","_","_","","_"], ["_","_","_","_","_","_"]]
      game.show_board
      expect(game.check_win("X")).to eql("Player X wins!")
    end
  end

  describe '#post_game_messages' do
    it "should print out 'DRAW!'" do
      expect do
        ConnectFour.new.post_game_messages("X")
      end.to output("\n1 2 3 4 5 6 7\n_ _ _ _ _ _ _ \n_ _ _ _ _ _ _ \n_ _ _ _ _ _ _ \n_ _ _ _ _ _ _ \n_ _ _ _ _ _ _ \n_ _ _ _ _ _ _ \n\nDRAW!\n").to_stdout
    end    
  end
end
