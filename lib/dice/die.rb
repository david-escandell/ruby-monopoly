# frozen_string_literal: true

class Die
  attr_reader :num_sides

  def initialize(num_sides=6)
    @num_sides = num_sides
  end

  def roll
    rand(1..@num_sides)
  end
end
