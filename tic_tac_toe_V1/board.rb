require "byebug"

class Board
    attr_reader :board
    def initialize
        @board = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        row, col = position
        if row > 2 || row < 0 || col > 2 || col < 0
            return false
        else
            true
        end
    end

    def empty?(position)
        row, col = position
        if @board[row][col] == '_'
            return true
        else
            false
        end
    end

    def place_mark(position, mark)
        if empty?(position) == false || valid?(position) == false
            raise "Invalid input or not empty"
        else
            row, col = position
            @board[row][col] = mark
        end
    end

    def print
        @board.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @board.each do |row|
            if row.all? { |el| el == mark }
                return true
            end
        end
        false
    end

    def win_col?(mark)
        @board.transpose do |col|
            if col.all? { |el| el == mark }
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        left_to_right = (0...@board.length).all? do |i|
            pos [i, i]
            self[pos] == mark
            return true
        end
        right_to_left = (0...@board.length).all? do |i|
            row = i 
            col = @grid.length - i - 1
            pos = [row, col]
            self[pos] == mark
        end
        false
    end

    def win?(mark)
        if win_row?(mark) == true || win_col?(mark) == true || win_diagonal?(mark) == true
            return true
        end
        false
    end

    def empty_positions?
        if @board.flatten.any? { |el| el == '_' }
            return true
        end
        false
    end




end
