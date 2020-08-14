# frozen_string_literal: true

require_relative 'codebreaker/guess_checker'
require_relative 'codebreaker/game'
require_relative 'codebreaker/loader'
require_relative 'codebreaker/version'
require 'yaml'

game = Codebreaker::Game.new('Katia', 'easy')
puts game.input_operation('2323')

game.input_code == game.code
game.save
