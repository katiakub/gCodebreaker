# frozen_string_literal: true

module Codebreaker
  module Validation
    MIN_NAME_LENGTH = 3
    MAX_NAME_LENGTH = 20
    GUESS_LENGTH = 4
    MIN_GUESS_RANGE = 1
    MAX_GUESS_RANGE = 6

    DIFFICULTIES = Loader.load('difficulties').keys

    def name_is_valid?(name)
      name.instance_of?(String) && name.length.between?(MIN_NAME_LENGTH, MAX_NAME_LENGTH)
    end

    def difficulty_is_valid?(difficulty)
      DIFFICULTIES.include?(difficulty.to_sym)
    end

    def input_is_valid?(input)
      /^[1-6]{4}$/.match?(input)
    end
  end
end
