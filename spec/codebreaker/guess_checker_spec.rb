# frozen_string_literal: true

require_relative '../spec_helper'

module Codebreaker
  RSpec.describe Game do
    context 'check result' do
      [
        ['6543', '5643', '++--'],
        ['6543', '6411', '+-'],
        ['6543', '6544', '+++'],
        ['6543', '3456', '----'],
        ['6543', '6666', '+'],
        ['6543', '2666', '-'],
        ['6543', '2222', ' '],
        ['6666', '1661', '++'],
        ['1234', '3124', '+---'],
        ['1234', '1524', '++-'],
        ['1234', '1234', '++++']
      ].each do |item|
        it 'returns correct result depends on input' do
          guess_checker = GuessChecker.new(item[0], item[1])
          guess_checker.symbols
          expect(guess_checker.check_input).to eq item[2]
        end
      end
    end
  end
end
