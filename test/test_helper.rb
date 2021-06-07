# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "shunter"

require "minitest/autorun"

ENV["shunter_default_adapter"] = "Shunter::Adapters::Memory"
