# frozen_string_literal: true

# die.rb

# class to represent Die object
class Die
  def initialize(num_sides)
    @num_sides = num_sides
  end

  def roll
    rand(1..@num_sides) + 1
  end
end
