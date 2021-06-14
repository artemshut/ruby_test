# frozen_string_literal: true

require 'require_all'
require_all 'lib'

Services::Parser.new(ARGV[0]).parse_file
