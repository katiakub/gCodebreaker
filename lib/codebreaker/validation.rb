module Codebreaker
  module Validation
    def name_is_valid?(name)
      name.instance_of?(String) && name.length.between?(3, 20)
    end

    def input_is_valid?(input)
      /^[1-6]{4}$/.match?(input)
    end
  end
end
