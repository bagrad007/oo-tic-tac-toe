require 'pry'
class TicTacToe
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2]  
    ]
    
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        string_to_int = string.to_i-1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
       @board[index] == "X" || @board[index] == "O" ? true : false 
    end

    def valid_move?(index)
        if self.position_taken?(index) == false && index.between?(0, 8)
            true
        else 
            false
        end
    end

    def turn_count
        # binding.pry
        @board.count("X") + @board.count("O")
    end

    def current_player
         turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please make a move 1-9"
        index_play = input_to_index(gets)
        if valid_move?(index_play)
            move(index_play, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combos|
            if @board[win_combos[0]] == "X" && @board[win_combos[1]] == "X" && @board[win_combos[2]] == "X"
                return win_combos
            elsif @board[win_combos[0]] == "O" && @board[win_combos[1]] == "O" && @board[win_combos[2]] == "O"
                return win_combos 
            end
        end
        return false
    end

    def full?
        !@board.include?(" ")
    end

    def draw? 
        if self.won?
            false
        elsif self.full?
            true
        end
    end

    def over?
        won? || draw?
    end

    def winner
       @board[won?[0]] unless !won?
    end

    def play
        turn until over?
        if draw?
            puts "Cat's Game!"
        elsif won?
            puts "Congratulations #{winner}!"
        end
       
    end

end