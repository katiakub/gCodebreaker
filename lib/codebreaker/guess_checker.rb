# frozen_string_literal: true

module Codebreaker
  class GuessChecker
    attr_accessor :inexact, :exact, :none

    MINUSE = '-'
    PLUS = '+'
    NONE = 'X'

    def initialize(code, code_input)
      @code = code.chars
      @code_input = code_input.chars
    end

    def symbols(inexact = MINUSE, exact = PLUS, none = NONE)
      @inexact = inexact
      @exact = exact
      @none = none
    end

    def check_input
      raw_result = mismatched
      matched_result = matched(raw_result)
      check_result(matched_result)
    end

    private

    def mismatched
      inexact = (@code & @code_input).map { |element| [@code.count(element), @code_input.count(element)].min }.sum
      @inexact * inexact
    end

    def matched(result)
      @code_input.each.with_index do |element, index|
        result.sub!(@inexact, @exact) if element == @code[index]
      end
      return result unless result.empty?

      @none
    end

    def check_result(result)
      result = result.chars
      result = result << @none until result.size == 4
      result.join
    end
  end
end
