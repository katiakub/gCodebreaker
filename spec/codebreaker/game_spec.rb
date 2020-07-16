# frozen_string_literal: true

require_relative '../spec_helper'

module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }

    it 'difficulties should be a hash' do
      expect(game.difficulties).to be_an_instance_of(Hash)
    end

    it 'code contains 4 letters from 0 to 6' do
      expect(game.send(:generate_code)).to match(/[0-6]{4}/)
    end

    it 'generates hint' do
      expect(game.hints_code).to include(game.send(:generate_hint))
    end

    it 'code should not be empty' do
      expect(game.code).not_to be_empty
    end

    it 'game option parameters are received and not empty' do
      game.send(:game_option, 'Katie', :easy)
      %i[name difficulty attempts_left hints_left]. each do |option|
        expect(game.send(option)).not_to be_nil
      end
    end

    it 'returns false if no hints' do
      allow(game).to receive(:hints_left?) { false }
      expect(game.hints_left?).to be false
    end

    it 'returns false if no attempts' do
      allow(game).to receive(:attempts_left?) { false }
      expect(game.attempts_left?).to be false
    end

    it 'win?' do
      game.input_code = '1234'
      game.code = '1234'
      expect(game.send(:win?)).to be true
    end

    it 'lose?' do
      game.input_code = '2345'
      game.code = '1234'
      expect(game.send(:win?)).to be false
    end

    context 'check result' do
      [
        ['6543', '5643', '++--'],
        ['6543', '6411', '+-'],
        ['6543', '6544', '+++'],
        ['6543', '3456', '----'],
        ['6543', '6666', '+'],
        ['6543', '2666', '-'],
        ['6543', '2222', ''],
        ['6666', '1661', '++'],
        ['1234', '3124', '+---'],
        ['1234', '1524', '++-'],
        ['1234', '1234', '++++']
      ].each do |item|
        it 'returns correct result depends on input' do
          game.send(:game_option, 'Katie', :easy)
          game.code = item[0]
          game.send(:input_operation, item[1])
          expect(game.send(:check_input)).to eq item[2]
        end
      end
    end
  end
end
