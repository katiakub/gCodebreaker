# frozen_string_literal: true

module Codebreaker
  class Game
    CODE_LENGTH = 4
    CODE_RANGE = (1..6).freeze
    attr_accessor :input_code, :code, :name, :difficulties, :difficulty, :hints_left, :attempts_left
    attr_reader :minuse, :plus, :none, :hints_code
    def initialize
      @difficulties = Codebreaker::Loader.load('difficulties')
      @code = generate_code
      @hints_code = @code.chars.shuffle
      symbols
    end

    def symbols(minuse = '-', plus = '+', none = '')
      @minuse = minuse
      @plus = plus
      @none = none
    end

    def game_option(name, difficulty)
      @name = name
      @difficulty = difficulty
      @attempts_left = difficulty_option[:attempts]
      @hints_left = difficulty_option[:hints]
    end

    def hint
      return unless hints_left?

      @hints_left -= 1
      generate_hint
    end

    def hints_left?
      @hints_left.positive?
    end

    def input_operation(input_code)
      @input_code = input_code
      return unless attempts_left?

      @attempts_left -= 1
      check_input
    end

    def attempts_left?
      @attempts_left.positive?
    end

    def win?
      @input_code == @code
    end

    def save
      Codebreaker::Loader.save(to_h, 'stats')
    end

    private

    def check_input(code = @code.chars)
      input = @input_code.chars
      minuses = (code & input).map { |element| [code.count(element), input.count(element)].min }.sum
      result = @minuse * minuses
      input.each.with_index do |element, index|
        result.sub!(@minuse, @plus) if element == code[index]
      end
      return result unless result.empty?

      @none
    end

    def generate_code
      Array.new(CODE_LENGTH) { rand(CODE_RANGE) }.join
    end

    def generate_hint
      @hints_code.pop
    end

    def difficulty_option
      @difficulties[@difficulty]
    end

    def to_h
      {
        name: @name,
        difficulty: @difficulty,
        attempts: difficulty_option[:attempts],
        hints: difficulty_option[:hints],
        code: @code,
        used_attempts: difficulty_option[:attempts] - @attempts_left,
        used_hints: difficulty_option[:hints] - @hints_left
      }
    end
  end
end
