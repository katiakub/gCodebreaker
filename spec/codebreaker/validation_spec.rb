# frozen_string_literal: true

require_relative '../spec_helper'

module Codebreaker
  RSpec.describe Validation do
    let(:game) { Class.new { extend Validation } }

    it 'returns true cause of correct data' do
      expect(game.name_is_valid?('Rspec')).to be true
    end

    it 'returns false cause name is not string' do
      expect(game.name_is_valid?([1234])).to be false
    end

    it 'returns false cause name is too short' do
      expect(game.name_is_valid?('Rs')).to be false
    end

    it 'returns false cause name is too long' do
      name = 'rspec' * 5
      expect(game.name_is_valid?(name)).to be false
    end

    it 'return true cause of correct data' do
      %i[1114 6542 4444 2464 2233].each do |input|
        expect(game.input_is_valid?(input)).to be true
      end
    end

    it 'return false cause input too short' do
      %i[1 12 123 12345 -1 0000].each do |invalid_input|
        expect(game.input_is_valid?(invalid_input)).to be false
      end
    end
  end
end
