module Codebreaker
  class Output
    def initialize
      I18n.load_path << Dir[File.expand_path('./lib/codebreaker/data/locales') + '/*.yml']
    end

    def greeting
      puts I18n.t(:hey)
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
      stats.each do |game|
        puts "Hey, #{game[:name]}
        Chosen difficulty: #{game[:difficulty]}
        Attempts: #{game[:attempts]}
        Hints: #{game[:hints]}"
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
      I18n(:goodbye)
    end

    def game_over
      puts I18n.t(:game_over)
    end
  end
end
