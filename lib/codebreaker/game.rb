# frozen_string_literal: true

module Codebreaker
  class Game
    attr_accessor :input_code, :code, :name, :difficulties, :difficulty, :hints_left, :attempts_left, :all_hints,
                  :all_attempts
    attr_reader :hints_code

    CODE_LENGTH = 4
    CODE_RANGE = (1..6).freeze

    def initialize(name, difficulty)
      @difficulties = Loader.load('difficulties')
      @code = generate_code
      @hints_code = @code.chars.shuffle
      game_option(name, difficulty)
    end

    def game_option(name, difficulty)
      @name = name
      @difficulty = difficulty.to_sym
      @all_attempts = difficulty_option[:attempts]
      @all_hints = difficulty_option[:hints]
      @attempts_left = difficulty_option[:attempts]
      @hints_left = difficulty_option[:hints]
    end

    def hint
      return unless hints_left?

      @hints_left -= 1
      generate_hint
    end

    def hints_left?
      hints_left.positive?
    end

    def input_operation(input_code)
      @input_code = input_code
      return unless attempts_left?

      @attempts_left -= 1
      check_input(@code, @input_code)
    end

    def attempts_left?
      attempts_left.positive?
    end

    def win?
      input_code == code
    end

    def save(filename = 'stats')
      Codebreaker::Loader.save(to_h, filename)
    end

    private

    def generate_code
      Array.new(CODE_LENGTH) { rand(CODE_RANGE) }.join
    end

    def generate_hint
      @hints_code.pop
    end

    def difficulty_option
      @difficulties[@difficulty]
    end

    def check_input(code, input)
      guess_checker = Codebreaker::GuessChecker.new(code, input)
      guess_checker.symbols
      guess_checker.check_input
    end

    def to_h
      {
        name: @name,
        difficulty: @difficulty,
        attempts: @all_attempts,
        hints: @all_hints,
        code: @code,
        used_attempts: @all_attempts - @attempts_left,
        used_hints: @all_hints - @hints_left,
        date: Time.now
      }
    end
  end
end
