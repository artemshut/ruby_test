# frozen_string_literal: true

module Validators
  ##
  # This class represents file parsing error
  #
  class ParserError < StandardError
  end

  ##
  # This class represents wrong file extension error
  #
  class FileExtensionError < ParserError
    def initialize
      super('.log files are allowed only')
    end
  end

  ##
  # This class represents file presence error
  #
  class FilePresenceError < ParserError
    def initialize
      super('Provided file does not exists')
    end
  end

  ##
  # This class represents file empty error
  #
  class FileEmptyError < ParserError
    def initialize
      super('Provided file is empty')
    end
  end
end
