module Codebreaker
  module Loader
    PATH = File.join(File.dirname(__FILE__), 'data/').freeze
    EXTENCTION = '.yml'.freeze
    def self.load(file_name)
      file_name = PATH + file_name + EXTENCTION.to_s
      if File.exist?(file_name)
        YAML.load_file(file_name)
      else
        File.new(file_name, 'w')
        []
      end
    end

    def self.save(obj, file_name)
      file_name = PATH + file_name + EXTENCTION.to_s
      stats = File.file?(file_name) && !File.zero?(file_name) ? YAML.load_file(file_name) : []
      stats << obj
      file = File.open(file_name, 'w')
      file.write(stats.to_yaml)
      file.close
    end
  end
end
