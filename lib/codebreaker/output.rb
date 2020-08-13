# frozen_string_literal: true

module Codebreaker
  class Output
    attr_reader :stats
    def initialize
      I18n.load_path << Dir[File.expand_path(File.join(File.dirname(__FILE__), 'data/locales/')) + '/*.yml']
      I18n.config.available_locales = :en
      @stats = Codebreaker::Loader.load('stats')
    end

    def greeting
      puts I18n.t(:hey)
    end

    def available_commands
      puts I18n.t(:available_commands)
    end

    def choose_name
      puts I18n.t(:choose_name)
    end

    def wrong_name
      puts I18n.t(:wrong_name)
    end

    def rules
      puts I18n.t(:rules)
    end

    def sort_stats
      @stats = @stats.sort_by do |game|
        [game[:attempts], game[:used_attempts],
         game[:used_hints]]
      end
    end

    def show_stats
      sort_stats
      @stats.each_with_index do |game, index|
        puts "Hey, #{game[:name]}
        Rating: #{index + 1}
        Attempts: #{game[:attempts]}
        Hints: #{game[:hints]}
        Chosen difficulty: #{game[:difficulty]}
        Used attempts: #{game[:used_attempts]}
        Used hints: #{game[:used_hints]}"
      end
    end

    def no_stats
      puts I18n.t(:no_stats)
    end

    def show_hint
      puts I18n.t(:get_hint)
    end

    def no_hints
      puts I18n.t(:no_hints)
    end

    def choose_difficulty
      puts I18n.t(:choose_difficulty)
    end

    def wrong_difficulty
      puts I18n.t(:wrong_difficulty)
    end

    def enter_guess
      puts I18n.t(:enter_guess)
    end

    def wrong_input
      puts I18n.t(:wrong_input)
    end

    def win
      puts I18n.t(:win)
    end

    def lose
      puts I18n.t(:lose)
      puts I18n.t(:code)
    end

    def save_result
      puts I18n.t(:save_result)
    end

    def goodbye
      puts I18n.t(:goodbye)
    end
  end
end
