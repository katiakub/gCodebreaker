module Codebreaker
  class Output
    attr_reader :stats
    def initialize
      I18n.load_path << Dir[File.expand_path(File.join(File.dirname(__FILE__), 'data/locales/')) + '/*.yml']
      I18n.config.available_locales = :en
      @stats = Codebreaker::Loader.load('stat')
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

    def show_stats
      @stats.each do |game|
        puts "Hey, #{game[:name]}
        Attempts: #{game[:attempts]}
        Hints: #{game[:hints]}
        Code: #{game[:code]}
        Chosen difficulty: #{game[:difficulty]}
        Unused attempts: #{game[:attempts_left]}
        Unused hints: #{game[:hints_left]}
        Win: #{game[:win]}"
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
      puts I18n.t(:code)
    end

    def choose_difficulty
      puts I18n.t(:choose_difficulty)
    end

    def wrong_difficulty
      puts I18n.t(:wrong_difficulty)
    end

    def wrong_input
      puts I18n.t(:wrong_input)
    end

    def win
      puts I18n.t(:win)
    end

    def lose
      puts I18n.t(:lose)
    end

    def save_result
      puts I18n.t(:save_result)
    end

    def goodbye
      puts I18n.t(:goodbye)
    end

    def game_over
      puts I18n.t(:game_over)
    end
  end
end
