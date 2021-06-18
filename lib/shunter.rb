# frozen_string_literal: true

require "logger"
require "active_model"

require_relative "shunter/version"
require_relative "shunter/adapters/redis"
require_relative "shunter/adapters/memory"
require_relative "shunter/integration/throttle"
require_relative "shunter/base"

module Shunter
  module_function

  class ThrottleError < StandardError; end

  BASE_LOGGER = ::Logger.new($stdout)
  ONE_MINUTE = 60
  ONE_HUNDRED_REQUESTS = 100

  BASE_CONNECTION = ENV["shunter_redis_connection"] || { host: "redis", port: 6379 }

  def default_timespan
    ENV["shunter_default_timespan"] || ONE_MINUTE
  end

  def default_threshold
    ENV["shunter_default_threshold"] || ONE_HUNDRED_REQUESTS
  end

  def default_adapter
    ENV["shunter_default_adapter"] || "Shunter::Adapters::Redis"
  end

  def feature_enabled?
    ActiveModel::Type::Boolean.new.cast(ENV["shunter_enabled"] || "false")
  end
end
