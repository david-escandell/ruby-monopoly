# frozen_string_literal: true

class DieCup
  attr_reader :dice

  def initialize
    @dice = []
  end

  def loaded?
    @dice.any?
  end

  def add_dice(*dice)
    dice.each { |die| @dice << die }
  end

  def remove_dice(*dice)
    dice.each { |die| @dice.delete die }
  end

  def roll
    rolled_value = 0
    @dice.each { |die| rolled_value += die.roll }

    rolled_value
  end
end
