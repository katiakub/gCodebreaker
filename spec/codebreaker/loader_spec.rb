require_relative '../spec_helper'

module Codebreaker
  RSpec.describe Loader do
    let(:stat) do
      {
        name: 'jjjj'
      }
    end

    it 'saves stat to file' do
      path = 'lib/codebreaker/data/'
      extenction = '.yml'
      file_name = 'rspec'
      Loader.send(:save, stat, file_name)
      file_name = path + file_name + extenction
      expect(File.exist?(file_name)).to eq true
      File.delete(file_name)
    end
  end
end
