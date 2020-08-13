# frozen_string_literal: true

module Codebreaker
  module Loader
    EXTENCTION = '.yml'
    def self.load(file_name)
      path = File.expand_path("./data/#{file_name}", __dir__)
      file_name = path + EXTENCTION.to_s
      if File.exist?(file_name)
        YAML.load_file(file_name)
      else
        File.new(file_name, 'w')
        []
      end
    end

    def self.save(obj, file_name)
      path = File.expand_path("./data/#{file_name}", __dir__)
      file_name = path + EXTENCTION.to_s
      stats = File.file?(file_name) && !File.zero?(file_name) ? YAML.load_file(file_name) : []
      stats << obj
      file = File.open(file_name, 'w')
      file.write(stats.to_yaml)
      file.close
    end
  end
end
