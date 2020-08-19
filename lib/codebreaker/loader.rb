# frozen_string_literal: true

module Codebreaker
  module Loader
    EXTENCTION = '.yml'
    def self.load_file(file_name)
      file_name = File.expand_path(file_name) + EXTENCTION.to_s
      if File.exist?(file_name)
        YAML.load_file(file_name)
      else
        File.new(file_name, 'w')
        []
      end
    end

    def self.load(file_name)
      path = File.join(File.dirname(__FILE__), 'data/')
      file_name = path + file_name + EXTENCTION.to_s
      if File.exist?(file_name)
        YAML.load_file(file_name)
      else
        File.new(file_name, 'w')
        []
      end
    end

    def self.save(obj, file_name)
      file_name = File.expand_path(file_name) + EXTENCTION.to_s
      stats = File.file?(file_name) && !File.zero?(file_name) ? YAML.load_file(file_name) : []
      stats << obj
      file = File.open(file_name, 'w')
      file.write(stats.to_yaml)
      file.close
    end
  end
end
