# frozen_string_literal: true

module Codebreaker
  module GuessChecker
    MINUSE = '-'
    PLUS = '+'
    NONE = ''

    def symbols(inexact = MINUSE, exact = PLUS, none = NONE)
      @inexact = inexact
      @exact = exact
      @none = none
    end

    def check_input(code, input)
      raw_result = inexact(code.chars, input.chars)
      exact(code.chars, input.chars, raw_result)
    end

    def inexact(code, input)
      inexact = (code & input).map { |element| [code.count(element), input.count(element)].min }.sum
      @inexact * inexact
    end

    def exact(code, input, result)
      input.each.with_index do |element, index|
        result.sub!(@inexact, @exact) if element == code[index]
      end
      return result unless result.empty?

      @none
    end
  end
end
