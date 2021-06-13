# frozen_string_literal: true

module Entities
  ##
  # Here's struct model for parsed page statistics
  #
  PageStatistics = Struct.new(:url, :visits, :uniq_visits)
end
