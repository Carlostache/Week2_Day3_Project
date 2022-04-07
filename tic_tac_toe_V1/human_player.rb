require "byebug"

class HumanPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position
        puts "Player, #{mark.to_s} enter two numbers, first for row, second for column like `row col`"
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "invalid entry try row space column again" if pos.length != 2
        pos
    end

end