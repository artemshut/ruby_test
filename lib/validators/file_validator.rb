# frozen_string_literal: true

module Validators
  ##
  # This class represents initial file validations
  #
  class FileValidator
    ALLOWED_FILE_EXTENSIONS = ['.log'].freeze

    def initialize(file_path)
      @file_path = file_path
    end

    def validate
      validate_file_extension
      validate_file_presence
      validate_file_not_empty
      true
    end

    private

    def validate_file_presence
      raise FilePresenceError unless File.file?(@file_path)
    end

    def validate_file_extension
      raise FileExtensionError unless ALLOWED_FILE_EXTENSIONS.include? File.extname(@file_path)
    end

    def validate_file_not_empty
      raise FileEmptyError if File.zero?(@file_path)
    end
  end
end
