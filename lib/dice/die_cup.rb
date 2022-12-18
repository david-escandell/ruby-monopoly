# frozen_string_literal: true

class DieCup
  attr_reader :dice

  def initialize
    @dice = []
  end

  def loaded?
    @dice.any?
  end

  # TODO: validate arguments are Die objects
  def add_dice(*dice)
    dice.each { |die| @dice << die }
  end

  def remove_dice(*dice)
    dice.each { |die| @dice.delete die }
  end

  def roll
    unless @dice.empty?
      rolled_value = 0
      @dice.each { |die| rolled_value += die.roll }

      rolled_value
    end
  end
end
